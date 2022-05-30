#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# 人数
@n = 8
# 最短移動距離
@min_step = 98
# ゴールになりうるパターンを全て列挙する
@goal = []
(1..@n).each{|i|
  @goal << (1..@n).to_a.reverse.rotate(i)
}

# 検索を行う
# child : 座った状態
# oni : 鬼の番号
# oni_pos : 鬼の前回の場所
# step : 現在のステップ数
# log : 移動の履歴
def search(child, oni, oni_pos, step, log)
  if oni == 0
    if @goal.include?(child)
      @min_step = [step, @min_step].min
    end
  end

  (1..(@n - 1)).each{|i|
    if step + @n + i <= @min_step
      next_child = child.clone
      pos = (oni_pos + i) % @n  # 次の鬼の位置
      next_child[pos] = oni     # 鬼が座る
      next_oni = child[pos]     # 次の鬼
      search(next_child, next_oni, pos, step + @n + i, log + pos.to_s)
    end
  }
end

# 最初は1の場所に鬼が入る
search([0] + (2..@n).to_a, 1, 0, @n, "0")
puts @min_step

