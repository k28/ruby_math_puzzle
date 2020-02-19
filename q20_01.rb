#! ruby -Ku

majic_square = [1, 14, 14, 4, 11, 7, 6, 9, 8, 10, 10, 5, 13, 2, 3, 15]

# 集計用のハッシュ
sum = Hash.new(0)

1.upto(majic_square.size) {|i|
  majic_square.combination(i){|set|
    total = set.inject(:+)
    sum[total] += 1
  }
}

# 合計が最大のものを出力 (ハッシュの値でソートする)
puts sum.max{|x, y| x[1] <=> y[1]}

