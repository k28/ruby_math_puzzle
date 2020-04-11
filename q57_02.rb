#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# 縦線と横線
v, h = 7, 10

total = 0

# [下の順列]に対して、横線の数を調査
(1..v).to_a.permutation.each{|final|
  start = (1..v).to_a
  cnt = 0
  v.times{|i|
    # [上の数]のどの位置にあるか調べる
    move = start.index(final[i])
    if move > 0
      # [上の数]を入れ替え (数を入れ替える事で移動を表現する)
      start[i], start[move] = start[move], start[i]
      cnt += move - i
    end
  }

  total += 1 if cnt == h
}

puts total

