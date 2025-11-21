#!/bin/sh

SCORE_FILE=".scores.txt"

calculate_gpa() {
	if [ "$1" -ge 90 ]; then
		echo "A"
	else
		echo "B"
	fi
}

calculate_average() {
	if [ ! -s $SCORE_FILE ]; then
		echo "0"
		return
	fi

	TOTAL_SCORE=0
	COUNT=0

	for SCORE in $(cat $SCORE_FILE); do
		TOTAL_SCORE=`expr $TOTAL_SCORE + $SCORE`
		COUNT=`expr $COUNT + 1`
	done

	if [ "$COUNT" -eq 0 ]; then
		echo "0"
	else
		AVG_SCORE=`expr $TOTAL_SCORE / $COUNT`
		echo "$AVG_SCORE"
	fi
}

while true; do
	echo "===================="
	echo "1) 과목 성적 추가"
	echo "2) 입력된 모든 점수 보기"
	echo "3) 평균 점수 확인"
	echo "4) 평균 등급 (GPA) 반환"
	echo "5) 종료"
	echo "===================="
	echo -n "옵션을 선택하세요 (1~5): "
	read MENU_CHOICE

	case $MENU_CHOICE in
		1)
			echo -n "점수를 입력하세요 (0-100): "
			read NEW_SCORE
			echo "$NEW_SCORE" >> $SCORE_FILE
			echo "과목 성적 $NEW_SCORE가 추가되었습니다."
			;;

		2)
			echo "--- 입력된 모든 점수 보기 ---"
			if [ -s $SCORE_FILE ]; then
				cat $SCORE_FILE
			else
				echo "입력된 점수가 없습니다."
			fi
			;;
		3)
			AVG_SCORE=$(calculate_average)
			echo "--- 평균 점수 ---"
			echo "$AVG_SCORE"
			;;
		4)
			AVG_SCORE=$(calculate_average)
			GRADE=$(calculate_gpa $AVG_SCORE)
			echo "--- 평균 등급 ---"
			echo "$GRADE"
			;;
		5)
			if [ -f $SCORE_FILE ]; then
				rm %SCORE_FILE 2>/dev/null
			fi
			echo "프로그램을 종료합니다."
			exit 0
			;;
		*)
			echo "옵션을 다시 선택해주세요 (1~5): "
			;;
	esac
done



