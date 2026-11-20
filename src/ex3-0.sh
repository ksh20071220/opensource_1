#!/bin/bash
# ex3-0.sh : MYENV 환경변수를 .bashrc에 등록/해제하고 유지 여부 확인
# 사용법: bash ex3-0.sh set   (등록)
#         bash ex3-0.sh unset (해제)

LINE='export MYENV="Hello Shell"'

case "$1" in
  set)
    if grep -q '^export MYENV=' ~/.bashrc; then
      echo "이미 .bashrc에 등록되어 있습니다."
    else
      echo "$LINE" >> ~/.bashrc
      echo ".bashrc에 등록 완료: $LINE"
    fi
    echo "[.bashrc 마지막 줄]"
    tail -n 1 ~/.bashrc
    echo "[새 셸에서 확인] MYENV = $(bash -ic 'echo $MYENV' 2>/dev/null)"
    ;;
  unset)
    sed -i '/^export MYENV=/d' ~/.bashrc
    unset MYENV
    echo ".bashrc에서 MYENV 삭제 완료"
    echo "[새 셸에서 확인] MYENV = '$(bash -ic 'echo $MYENV' 2>/dev/null)' (빈 값 → 유지되지 않음)"
    ;;
  *)
    echo "사용법: $0 set | unset"
    ;;
esac
