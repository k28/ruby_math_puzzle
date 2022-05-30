#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

W, H = 6, 5 # ( 横 x 縦 )
USABLE = 2
@max = 0                  # 最長の長さ
@h = Array.new(H + 1, 0)  # 横方向の通った回数
@v = Array.new(W + 1, 0)  # 縦方向の通った回数

def search(x, y) 
  if x == W && y == H
    @max =  [@h.inject(:+) + @v.inject(:+), @max].max
    return
  end

  # 上下右左移動を検証

  # 縦方向を検証
  if @v[x] < USABLE
    if y - 1 >= 0
      @v[x] += 1
      search(x, y - 1)
      @v[x] -= 1
    end

    if y + 1 <= H
      @v[x] += 1
      search(x, y + 1)
      @v[x] -= 1
    end
  end
  
  # 横方向を検証
  if @h[y] < USABLE
    # 左
    if x + 1 <= W
      @h[y] += 1
      search(x + 1, y)
      @h[y] -= 1
    end

    # 右
    if x - 1 >= 0
      @h[y] += 1
      search(x - 1, y)
      @h[y] -= 1
    end
  end
end

search(0, 0)

puts @max

