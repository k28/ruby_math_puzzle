#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

#
# 大きい数から先に置くようにして高速化する
#

N = 11
cards = [0] * N * 2 # カードの初期値
@count = 0

def search(cards, num)
  if num == 0
    @count += 1
  else
    # 置けるかチェックしながら、順に配置
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0
        cards[i], cards[i + num + 1] = num, num
        search(cards, num - 1)
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, N)
puts @count


