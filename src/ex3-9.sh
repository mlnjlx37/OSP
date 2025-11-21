#!/bin/sh

DB_FILE="DB.txt"

while true; do
	echo "===================="
	echo "1) 팀원 정보 추가"
	echo "2) 팀원과 한 일 기록"
	echo "3) 팀원 검색"
	echo "4) 수행 내용 검색"
	echo "5) 종료"
	echo "===================="
	echo -n "옵션을 선택하세요 (1~5): "
	read MENU_CHOICE

	case $MENU_CHOICE in
		1)
			echo "--- 팀원 정보 추가 ---"
			echo -n "이름: "
			read NAME
			echo -n "생일 (예:040409): "
			read BIRTHDAY
			echo -n "전화번호 (예:010-xxxx-xxxx): "
			read PHONE

			echo "[MEMBER] $NAME | $BIRTHDAY | $PHONE" >> "$DB_FILE"
			echo "팀원 정보 ($NAME)가 추가되었습니다."
			;;
		2)
			echo "--- 팀원과 한 일 기록 ---"
			echo -n "날짜 (예: 2025-11-19): "
			read DATE
			echo -n "수행 내용: "
			read CONTENT

			echo "[MEETING] $DATE | $CONTENT" >> "$DB_FILE"
			echo "수행 내용 ($DATE)이 기록되었습니다."
			;;
		3)
			echo "--- 팀원 검색 ---"
			echo -n "검색할 팀원 이름: "
			read SEARCH_NAME

			echo "=== 팀원 정보 검색 결과 ==="
			grep -a "[MEMBER]" "$DB_FILE" | grep "$SEARCH_NAME" || echo "해당 이름의 팀원 정보를 찾을 수 없습니다."
			echo "=============================="
			;;
		4)
			echo "--- 수행 내용 검색 ---"
			echo -n "검색할 수행 날짜 (예:2025-11-19): "
			read SEARCH_DATE

			echo "=== 수행 내용 검색 결과 ==="
			grep -a "[MEETING]" "$DB_FILE" | grep "$SEARCH_DATE" || echo "해당 날짜의 수행 내용을 찾을 수 없습니다."
			echo "=============================="
			;;
		5)
			echo "프로그램을 종료합니다."
			exit 0
			;;
		*)
			echo "옵션을 다시 입력하세요 (1~5): "
			;;
	esac
	echo
done

