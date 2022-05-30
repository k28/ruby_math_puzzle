#! ruby -Ku

#
# 動的計画法で高速化するパターン
#

majic_square = [1, 14, 14, 4, 11, 7, 6, 9, 8, 10, 10, 5, 13, 2, 3, 15]
#majic_square = [1, 1, 2, 3, 5]

sum_all = majic_square.inject(:+)

# 集計用のハッシュ
sum = Array.new(sum_all + 1){0}

# 初期値(何も足さない時が1個)
sum[0] = 1
majic_square.each{|n|
  # 大きい方から順に加算
  (sum_all - n).downto(0).each{|i|
    sum[i + n] += sum[i]
    #puts "#{n} #{i} #{sum.inspect}"
  }

  #puts sum.inspect
}

# 合計が最大の物を出力
puts sum.find_index(sum.max)

