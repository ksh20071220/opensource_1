#!/bin/bash
# ex3-6.sh : 폴더 확인/생성 -> 파일 5개 생성 -> 압축 -> 새 폴더에 압축 해제
# 사용법: bash ex3-6.sh 폴더이름

dir=${1:-testdir}

if [ -d "$dir" ]; then
  echo "'$dir' 폴더가 이미 있습니다."
else
  mkdir "$dir"
  echo "'$dir' 폴더가 없어서 새로 생성했습니다."
fi

for i in 1 2 3 4 5; do
  echo "this is file$i" > "$dir/file$i.txt"
done
echo "[파일 5개 생성]"; ls "$dir"

tar -czf "$dir.tar.gz" -C "$dir" .
echo "[압축 완료] $dir.tar.gz"

mkdir -p "${dir}_unzip"
tar -xzf "$dir.tar.gz" -C "${dir}_unzip"
echo "[새 폴더 ${dir}_unzip 에 압축 해제]"; ls "${dir}_unzip"
