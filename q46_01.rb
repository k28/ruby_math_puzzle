#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# ソートされた順番からシャッフルしながら回数を算出する

N = 7
checked = {(1..N).to_a => 0}  # チェック済みの配列
check = [(1..N).to_a]         # チェック対象
depth = 0                     # 交換回数

while check.size > 0
  next_check = []
  (0..(N-1)).to_a.combination(2){|i, j| # 2箇所選択して交換
    check.each{|c|
      d = c.clone
      d[i], d[j] = d[j], d[i]
      if !checked.has_key?(d)
        checked[d] = depth + 1
        next_check << d
      end
    }
  }
  check = next_check
  depth += 1
  puts depth
end

puts checked.values.inject(:+)

