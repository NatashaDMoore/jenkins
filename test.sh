#!/usr/bin/env bash

PATTERN1='^[+-]'                                     # Finds lines beginning with plus or minus
PATTERN2='^\S+\s+\(.*\)\s+\S+\s+\S+\s+\[.*\].*$'     # Lines with tags or refs
PATTERN3='.*sshd.*session.*'                         # Lines representing new ssh sessions

# Test Pattern 1
egrep "$PATTERN1" should-match.txt
exit_code1=$?
egrep -v "$PATTERN1" should-not-match.txt
exit_code2=$?

echo "Pattern 1 (should match): $exit_code1"
echo "Pattern 1 (should not match): $exit_code2"

# Test Pattern 2
egrep "$PATTERN2" should-match.txt
exit_code3=$?
egrep -v "$PATTERN2" should-not-match.txt
exit_code4=$?

echo "Pattern 2 (should match): $exit_code3"
echo "Pattern 2 (should not match): $exit_code4"

# Test Pattern 3
egrep "$PATTERN3" should-match.txt
exit_code5=$?
egrep -v "$PATTERN3" should-not-match.txt
exit_code6=$?

echo "Pattern 3 (should match): $exit_code5"
echo "Pattern 3 (should not match): $exit_code6"

if [ "$exit_code1" -eq 0 ] && [ "$exit_code3" -eq 0 ] && [ "$exit_code5" -eq 0 ] && [ "$exit_code2" -eq 0 ] && [ "$exit_code4" -eq 0 ] && [ "$exit_code6" -eq 0 ]; then
  echo "Success"
else
  echo "Failure"
fi

