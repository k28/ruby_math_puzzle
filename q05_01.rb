#! ruby -Ku

# 10, 50, 100, 500のセットのパターン
coins = [10, 50, 100, 500]
goal = 1000

#
# coinの組み合わせパターンは2から15枚まで
#
cnt = 0
(2..15).each {|i|
  # 重複を許可した組み合わせを考える
  coins.repeated_combination(i).each {|coin_set|
    cnt += 1 if coin_set.inject(:+) == goal
  }
}

puts cnt

