#!/bin/bash
# ex3-9.sh : DB.txt에서 팀원 정보 검색 (이름 일부나 번호로도 검색 가능)
# 사용법: bash ex3-9.sh 검색어   (인자가 없으면 입력받음)

DB=DB.txt

if [ ! -f "$DB" ]; then
  echo "DB.txt가 없습니다. ex3-8.sh를 먼저 실행하세요."
  exit 1
fi

key=$1
[ -z "$key" ] && read -p "검색할 이름: " key

echo "[검색어: $key]"
if ! grep -i -- "$key" "$DB"; then
  echo "검색 결과가 없습니다."
fi
