#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

EURO = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26]
US   = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 0, 27, 10, 25, 29, 12, 8, 19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2]

# listから円順列にn個取得した時の最大値を算出する
def seek_max_total(list, n)
  list_total = list.size
  t = 0
  (0..list_total).each do |i|
    a = 0
    for v in 0...n do
      # 配列を超えない様に配列の個数で割った余を使う
      a += list[(i+v)%list_total]
    end
    t = a if a > t
  end

  t
end


t = 0
(2..36).each do |n|
  euro = seek_max_total(EURO, n)
  us = seek_max_total(US, n)
  t += 1 if euro < us
end
puts t

