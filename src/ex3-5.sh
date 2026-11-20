#!/bin/bash
# ex3-5.sh : 시스템 상태 확인 메뉴 + 내부 함수로 리눅스 명령어 실행
# 사용법: bash ex3-5.sh          (시스템 상태 메뉴)
#         bash ex3-5.sh -l -a    (인자를 내부 함수의 ls 옵션으로 전달)

# 내부 함수: 전달받은 인자를 ls 명령어의 옵션으로 사용
run_ls() {
  echo "[함수 run_ls 실행] 명령어: ls $*"
  ls "$@"
}

# 인자가 있으면 내부 함수 실행 후 종료
if [ $# -gt 0 ]; then
  run_ls "$@"
  exit 0
fi

while true; do
  echo "========================"
  echo "1) 사용자 정보"
  echo "2) GPU 또는 CPU 사용률 확인"
  echo "3) 메모리 사용량 확인"
  echo "4) 디스크 사용량 확인"
  echo "5) 종료"
  echo "========================"
  read -p "선택: " menu

  case $menu in
    1) echo "사용자: $(whoami)"; id; who ;;
    2)
      if command -v nvidia-smi > /dev/null; then
        nvidia-smi
      else
        echo "GPU(nvidia-smi) 없음 -> CPU 사용률 확인"
        top -b -n 1 | head -n 12
      fi
      ;;
    3) free -h ;;
    4) df -h /; echo "[홈 폴더 사용량]"; du -sh ~ 2>/dev/null ;;
    5) echo "종료합니다."; break ;;
    *) echo "1~5 중에서 선택하세요." ;;
  esac
done
