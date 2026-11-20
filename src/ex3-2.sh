#!/bin/bash
# ex3-2.sh : y = (1/2) * x^2 계산 (실수 범위)

read -p "x 값을 2개 이상 입력하세요 (공백으로 구분): " -a xs

if [ ${#xs[@]} -lt 2 ]; then
  echo "오류: 2개 이상 입력해야 합니다."
  exit 1
fi

for x in "${xs[@]}"; do
  if ! [[ $x =~ ^-?[0-9]*\.?[0-9]+$ ]]; then
    echo "x = $x : 숫자가 아닙니다."
    continue
  fi
  y=$(echo "scale=4; ($x) * ($x) / 2" | bc)
  printf "x = %s  ->  y = %.4f\n" "$x" "$y"
done
