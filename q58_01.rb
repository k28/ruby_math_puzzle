#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# 生徒の状態
# a 連絡待ち
# b 先生から連絡を受けた, 先生に連絡した, 他の人に連絡した
# c 生徒から連絡を受けて誰にも連絡していない

n = 14
# 初期状態の人数をセット, (a, b, c の人数, 先生が電話した回数)
# 初めは全員[a]の状態
status = [[n, 0, 0, 0]]
step = 0 # 経過時間

while status.select{|s| s[1] == n}.size == 0
  # 全員bになるまで以下を繰り返す
  next_status = []
  status.each{|s|
    (s[1] + 1).times{|b|
      # 連絡が不要な生徒が他の生徒に連絡する人数
      (s[2] + 1).times{|c|
        # 連絡が必要な生徒が連絡する人数
        if s[2] > 0 # 発信できる生徒がいる時
          # 生徒から先生あり
          next_a = s[0] - b - c + 1
          if next_a >= 0
            next_status << [next_a, s[1] + c, s[2] + b - 1, s[3] + 1]
          end
        end

        # 先生への連絡なし
        next_a = s[0] - b - c
        if next_a >= 0
          next_status << [next_a, s[1] + c, s[2] + b, s[3]]
        end

        # 先生->生徒あり
        next_a = s[0] - b - c - 1
        if next_a >= 0
          next_status <<  [next_a, s[1] + c + 1, s[2] + b, s[3] + 1]
        end
      }
    }
  }

  status = (next_status - status).uniq
  step += 1
end

# 経過時間を表示
puts step
# 最短の中で, 先生が電話する回数が最小のものを表示
p status.select{|s| s[1] ==  n}.min{|a, b| a[3] <=> b[3]}

