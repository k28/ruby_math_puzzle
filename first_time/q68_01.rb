#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

N = 6
FREE, USED, WALL = 0, 1, 9

# 版兵として両端と真ん中に壁をセット
@seat = [WALL] + [FREE] * N + [WALL] + [FREE] * N + [WALL]

def search(person)
  count = 0
  @seat.size.times{|i|
    if @seat[i] == FREE
      if @seat[i - 1] != USED && @seat[i + 1] != USED
        @seat[i] = USED
        count += search(person + 1)
        @seat[i] = FREE
      end
    end
  }

  if count > 0
    # 隣に人がいない座席があれば、上記でカウントした結果を返す
    return count
  else
    # 階乗を返す
    return (1..@seat.count(FREE)).inject(:*)
  end
end

puts search(0)

