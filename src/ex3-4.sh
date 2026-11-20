#!/bin/bash
# ex3-4.sh : 메뉴 반복 성적 관리 프로그램

names=()
scores=()

average() {
  local sum=0
  for s in "${scores[@]}"; do sum=$((sum + s)); done
  echo "scale=2; $sum / ${#scores[@]}" | bc
}

while true; do
  echo "==================="
  echo "1) 과목 성적 추가"
  echo "2) 입력된 모든 점수 보기"
  echo "3) 평균 점수 확인"
  echo "4) 평균 등급 (GPA) 변환"
  echo "5) 종료"
  echo "==================="
  read -p "선택: " menu

  case $menu in
    1)
      read -p "과목명: " name
      read -p "점수(0~100): " score
      if [[ $score =~ ^[0-9]+$ ]] && [ $score -le 100 ]; then
        names+=("$name")
        scores+=("$score")
        echo "$name ($score점) 추가 완료"
      else
        echo "잘못된 점수입니다."
      fi
      ;;
    2)
      if [ ${#scores[@]} -eq 0 ]; then echo "입력된 성적이 없습니다."; continue; fi
      for i in "${!scores[@]}"; do
        echo "$((i + 1)). ${names[$i]} : ${scores[$i]}점"
      done
      ;;
    3)
      if [ ${#scores[@]} -eq 0 ]; then echo "입력된 성적이 없습니다."; continue; fi
      echo "평균 점수: $(average)점"
      ;;
    4)
      if [ ${#scores[@]} -eq 0 ]; then echo "입력된 성적이 없습니다."; continue; fi
      avg=$(average)
      a=${avg%.*}; a=${a:-0}
      if   [ $a -ge 95 ]; then g="A+"; gpa=4.5
      elif [ $a -ge 90 ]; then g="A";  gpa=4.0
      elif [ $a -ge 85 ]; then g="B+"; gpa=3.5
      elif [ $a -ge 80 ]; then g="B";  gpa=3.0
      elif [ $a -ge 75 ]; then g="C+"; gpa=2.5
      elif [ $a -ge 70 ]; then g="C";  gpa=2.0
      elif [ $a -ge 65 ]; then g="D+"; gpa=1.5
      elif [ $a -ge 60 ]; then g="D";  gpa=1.0
      else g="F"; gpa=0.0
      fi
      echo "평균 $avg점 -> 등급 $g (GPA $gpa / 4.5)"
      ;;
    5)
      echo "프로그램을 종료합니다."
      break
      ;;
    *)
      echo "1~5 중에서 선택하세요."
      ;;
  esac
done
