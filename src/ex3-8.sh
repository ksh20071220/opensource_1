#!/bin/bash
# ex3-8.sh : 팀원 이름과 생일/전화번호를 DB.txt에 기록
# 사용법1: bash ex3-8.sh 이름 정보   (인자로 바로 이어서 추가)
# 사용법2: bash ex3-8.sh             (메뉴: 이어서 추가 / 처음부터 다시 작성)

DB=DB.txt

# 인자가 있으면 바로 추가
if [ $# -ge 2 ]; then
  echo "$1 ${*:2}" >> "$DB"
  echo "-> 저장: $1 ${*:2}"
  exit 0
fi

echo "1) 이어서 추가   2) 처음부터 다시 작성"
read -p "선택: " mode
if [ "$mode" = "2" ]; then
  > "$DB"
  echo "DB.txt를 비우고 새로 작성합니다."
fi

while true; do
  read -p "이름 (엔터만 누르면 종료): " name
  [ -z "$name" ] && break
  read -p "생일 또는 전화번호: " info
  echo "$name $info" >> "$DB"
  echo "-> 저장: $name $info"
done

echo "===== 현재 DB.txt ====="
cat "$DB"
