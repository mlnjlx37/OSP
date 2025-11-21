#!/bin/sh

echo -n "첫 번째 X를 입력하세요: "
read X1

echo -n "두 번째 X를 입력하세요: "
read X2

Y1=$(echo "0.5 * $X1 * $X1" | bc)
echo "X=$X1 일 때, Y=$Y1"

Y2=$(echo "0.5 * $X2 * $X2" | bc)
echo "X=$X2 일 때, Y=$Y2"

exit 0
