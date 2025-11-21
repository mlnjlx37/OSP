#!/bin/sh

TOTAL_SCORE=0
COUNT=0

while true; do
	echo -n "점수를 입력하세요: "
	read SCORE

	if [ "$SCORE" = "q" ]; then
		break
	fi

	if [ "$SCORE" -ge 90 ]; then
		GRADE="A"
	else
		GRADE="B"
	fi

	echo "-> GRADE: $GRADE"

	TOTAL_SCORE=`expr $TOTAL_SCORE + $SCORE`
	COUNT=`expr $COUNT + 1`
done

if [ $COUNT -eq 0 ]; then
	echo "점수가 입력되지 않았습니다."
else
	AVERAGE_SCORE=`expr $TOTAL_SCORE / $COUNT`

	echo "총 과목 수: $COUNT"
	echo "평균 점수: $AVERAGE_SCORE"

	if [ "$AVERAGE_SCORE" -ge 90 ]; then
		AVG_GRADE="A"
	else
		AVG_GRADE="B"
	fi

	echo "평균 등급: $AVG_GRADE"
fi


exit 0
