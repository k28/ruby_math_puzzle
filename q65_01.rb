#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# それぞの番号のボールを持っている
# 持っていない人は0

# ペアは6組だけど、6組だと時間がかかる
# 両方から探索すれば高速化できる
PAIR = 5

# 開始と終了を設定
start = (1..PAIR * 2 - 1).to_a + [0]
goal  = [0] + (2..PAIR * 2 - 1).to_a + [1]

# 投げられる一覧を取得
def throwable(balls)
  result = []
  balls.each{|ball|
    c = ball.index(0)
    p = (c + PAIR) % (PAIR * 2)
    [-1, 0, 1].each{|d|
      if (p + d) / PAIR == p / PAIR
        ball[c], ball[p + d] = ball[p + d], ball[c]
        result.push(ball.clone)
        ball[c], ball[p + d] = ball[p + d], ball[c]
      end
    }
  }

  return result
end

# 初期状態を設定
balls = [start]
log   = [start]
cnt   = 0

# 巾優先探索を実行
while !balls.include?(goal)
  next_balls = throwable(balls) # 次のステップを取得
  balls = next_balls - log      # 過去に現れていない結果を追加
  log |= next_balls
  cnt += 1
end

puts cnt

