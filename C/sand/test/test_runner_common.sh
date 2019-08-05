#!/bin/sh

# Tests sometimes chdir, so we get the full path now. `pwd` is annoying to portable.
WORK_QUEUE_WORKER=work_queue_worker

dispatch()
{
	case "$1" in
		check_needed)
			check_needed $@
			;;
		prepare)
			prepare $@
			;;
		run)
			run $@
			;;
		clean)
			clean $@
			;;
		*)
			echo "unknown command: $1"
			echo "use: $0 [check_needed|prepare|run|clean]"
			exit 1
			;;
	esac
	exit $?
}

# wait_for_file_creation(filename, timeout)
# Waits at most timeout seconds (default 5) for filename to be created.
# Returns 0 if filename created before timeout, otherwise terminates the script.
wait_for_file_creation()
{
	filename=$1
	timeout=${2:-5}
	counter_seconds=0

	[ -z $filename ] && exit 1

	while [ $counter_seconds -lt $timeout ];
	do
		[ -f $filename ] && return 0
		counter_seconds=$(($counter_seconds + 1))
		sleep 1
	done

	exit 1
}

# wait_for_file_modification(filename, timeout)
# returns until the last modification to filename is timeout seconds (default 5) in the past.
wait_for_file_modification()
{
	filename=$1
	timeout=${2:-5}

	case `uname -s` in
		Darwin)
			args="-f %m $filename"
		;;
		*)
			args="-c %Y $filename"
		;;
	esac

	while true; do
		sleep 1
		[ ! -f $filename ] && exit 1
		mtime=`stat $args`
		now=`date +"%s"`
		delta=$(($now-$mtime))
		[  $delta -gt 3 ] && break
	done
}

run_local_worker()
{
	local port_file=$1
	local log=$2
	local timeout=15

	if [ -z "$log" ]; then
		log=worker.log
	fi

	echo "Waiting for master to be ready."
	if wait_for_file_creation $port_file $timeout
	then
		echo "Master is ready on port `cat $port_file` "
	else
		echo "ERROR: Master failed to respond in $timeout seconds."
		exit 1
	fi
	echo "Running worker."
	if ! "$WORK_QUEUE_WORKER" --single-shot --timeout=10s --cores 1 --memory 250 --disk 250 --debug=all --debug-file="$log" localhost $(cat "$port_file"); then
		echo "ERROR: could not start worker"
		exit 1
	fi
	echo "Worker completed."
	return 0
}

require_identical_files()
{
	echo "Comparing output $1 and $2"
	if diff $1 $2
	then
		echo "$1 and $2 are the same."
		return 0
	else
		echo "ERROR: $1 and $2 differ!"
		exit 1
	fi
}

check_needed()
{
# to be implemented by individual tests that are optional.
# For an example, see chirp/test/TR_chirp_python.sh
	return 0
}

# For OS X
if ! echo $PATH | grep /sbin > /dev/null 2>&1; then
	export PATH=$PATH:/usr/sbin:/sbin
fi

# vim: set noexpandtab tabstop=4: