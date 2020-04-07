#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

M = 1 # 包紙の数
N = 4 # 中身のお菓子
@memo = {}

#
# candyの包み方を検索する
# candy : お菓子[4, 4, 4, 4]  (それぞれの種類のお菓子の残りの数)
# color : 包みずみのお菓子
def search(candy, color)
  return 1 if candy == [0] * N
  # メモしていたのがあればそれを使う
  return @memo[candy + [color]] if @memo.has_key?(candy + [color])

  # 包紙と中身が不一致なものをカウント
  cnt = 0
  candy.size.times{|i|
    if i != (color % candy.size)        # 包紙と中身が不一致の場合
      # colorは其々の包紙が1種類ずつ並んでいるイメージ,
      # (ABCDABCDABC...)
      # 自分の番号(mod)の場所には入れられないので
      # i != color % candy.size の場合は並べる事ができる
      #puts "#{candy.inspect} #{color} #{i} #{color % candy.size}"
      if candy[i] > 0                   # お菓子が残っている
        candy[i] -= 1
        cnt += search(candy, color + 1) # 次を検索
        candy[i] += 1
      end
    end
  }

  @memo[candy + [color]] = cnt
  return cnt
end

puts search([M] * N, 0)

