#!/bin/bash
# ex3-7.sh : 폴더에 파일 5개 생성 -> 파일 이름대로 하위 폴더 생성 -> 각 폴더에 파일 링크
# 사용법: bash ex3-7.sh 폴더이름

dir=${1:-linkdir}
mkdir -p "$dir"
cd "$dir" || exit 1

for i in 1 2 3 4 5; do
  f="file$i.txt"
  echo "this is $f" > "$f"
  sub="file$i"
  mkdir -p "$sub"
  ln -sf "../$f" "$sub/$f"     # 하위 폴더 안에 원본 파일을 가리키는 심볼릭 링크
done

echo "[$dir 폴더 내용]"
ls -l
echo "[하위 폴더의 링크 확인]"
ls -l file*/
echo "[링크로 파일 읽기] $(cat file1/file1.txt)"
