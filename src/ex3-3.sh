#!/bin/bash
# ex3-3.sh : 과목 점수를 입력받아 A/B 등급과 평균 등급 출력 (90 이상 A, 미만 B)

grade() {
  if [ $(echo "$1 >= 90" | bc) -eq 1 ]; then echo "A"; else echo "B"; fi
}

read -p "과목 점수를 2개 이상 입력하세요 (0~100, 공백 구분): " -a scores

if [ ${#scores[@]} -lt 2 ]; then
  echo "오류: 2과목 이상 입력해야 합니다."
  exit 1
fi

sum=0
i=1
for s in "${scores[@]}"; do
  if ! [[ $s =~ ^[0-9]+$ ]] || [ $s -gt 100 ]; then
    echo "오류: '$s' 은(는) 0~100 사이 정수가 아닙니다."
    exit 1
  fi
  echo "과목$i : $s 점 -> $(grade $s)"
  sum=$((sum + s))
  i=$((i + 1))
done

avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc)
echo "-------------------------"
echo "평균 : $avg 점 -> 평균 등급 $(grade $avg)"
