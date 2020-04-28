#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

N = 6
FREE, USED, WALL = 0, 1, 9

# 版兵として両端と真ん中に壁をセット
seat = [WALL] + [FREE] * N + [WALL] + [FREE] * N + [WALL]

@memo = {}

def search(seat)
  return @memo[seat] if @memo.has_key?(seat)
  count = 0
  seat.size.times{|i|
    if seat[i] == FREE
      if seat[i - 1] != USED && seat[i + 1] != USED
        seat[i] = USED
        count += search(seat)
        seat[i] = FREE
      end
    end
  }

  if count > 0
    # 隣に人がいない座席があれば、上記でカウントした結果を返す
    @memo[seat] = count
    return count
  else
    # 階乗を返す
    kai = (1..seat.count(FREE)).inject(:*)
    @memo[seat] = kai
    return kai
  end
end

puts search(seat)

