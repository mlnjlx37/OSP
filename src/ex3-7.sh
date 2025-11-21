#!/bin/sh

show_user_info() {
	echo "--- 1. 사용자 정보 ---"
	echo "사용자: $(whoami)"
}

show_gpu_cpu_usage() {
	echo "--- 2. GPD/CPU 사용률 확인 ---"
	echo "--- CPU 사용률 ---"
	top -b -n 1 | head -n 5

	echo "--- GPU 사용률 ---"
	nvidia-smi	
}

show_memory_usage() {
	echo "--- 3. 메모리 사용량 확인 ---"
	free -h
}

show_disk_usage() {
	echo "--- 4. 디스크 사용량 확인 ---"
	echo "--- 파일 시스템 전체 사용량 ---"
	df -h
	
	echo "--- 현재 디렉토리 용량 ---"
	du -sh .
}


echo "===================="
echo "1) 사용자 정보, 2) GPU 또는 CPU 사용률 확인, 3) 메모리 사용량 확인, 4) 디스크 사용량 확인"
echo "===================="
echo -n "옵션을 선택하세요 (1~5): "
read MENU_CHOICE

case $MENU_CHOICE in
	1)
		show_user_info
		;;
	2) 
		show_gpu_cpu_usage
		;;
	3) 
		show_memory_usage
		;;
	4) 
		show_disk_usage
		;;
	*)
		echo "옵션을 다시 선택해주세요 (1~5): "
		;;
esac
echo

exit 0
