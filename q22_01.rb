#! ruby -Ku

n = 16
# 1, 2, 4, 6, 8, .... 人の時のパターンをいれる
pair = Array.new(n / 2 + 1){0}

pair[0] = 1
1.upto(n / 2){|i|
  pair[i] = 0

  # 各ペアに対して、両側のメンバーの組み合わせを掛け合わせた物の和を求める
  i.times{|j|
    pair[i] += pair[j] * pair[i - j - 1]
  }

  #puts pair.inspect
}

puts pair[n/2]

