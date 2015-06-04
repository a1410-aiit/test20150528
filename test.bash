#!/bin/bash

#echo "This is a Test."
#echo "AAAAAA"

tmp=/tmp/$$

ERROR_EXIT () {
	echo "$1" >&2
	rm -f $tmp-*
	exit 1
}

#################################################
# TEST
#################################################

# 引数
if [ $# -lt 2 ] ; then
	ERROR_EXIT "TEST-ARG-1"
fi

# 処理
echo aaa bbb NG > $tmp-ans
./same.py aaa bbb > $tmp-out || ERROR_EXIT "TEST1-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST1-2"

# echo aaa aaa OK > $tmp-ans2
# ./same.py aaa aaa > $tmp-out2 || ERROR_EXIT "TEST2-1"
# test $tmp-ans2 = $tmp-out2 ; ERROR_EXIT "TEST2-2"


echo OK
rm -f $tmp-*
