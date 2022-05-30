#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# 横線と縦線
v, h = 7, 10

total = 0

# [下の数]の位置について、交換する必要にある数をカウント
(0..(v-1)).to_a.permutation.each{|final|
  cnt = 0
  v.times{|i|
    # 交差する数値のうち、大きい方をカウントする(小さい方でもOK)
    cnt += final.take_while{|j| j != i}.count{|k| k > i}
  }

  total += 1 if cnt == h
}

puts total


