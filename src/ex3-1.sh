#!/bin/sh

sum=`expr $1 + $2`
echo "Add: $1 + $2 = $sum"

sub=`expr $1 - $2`
echo "Sub: $1 - $2 = $sub"

mul=`expr $1 \* $2`
echo "Mul: $1 * $2 = $mul"

div=`expr $1 / $2`
echo "Div: $1 / $2 = $div"

exit 0
