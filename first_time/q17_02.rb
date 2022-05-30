#! ruby -Ku

N = 30
boy, girl = 1, 0

N.times{|i|
  # n - 1 人まで並んでいる状態から始める
  boy, girl = boy + girl, boy
}

puts boy + girl

