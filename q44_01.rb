#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# aの量が半分になるか探索する
# abc: コップの状態
# depth: 移動回数
# max_abc: 各コップの量[a, b, c]
# 探索のログ
def search(abc, depth, max_abc, log)
  return false if log.has_key?(abc)       # 探索済み
  return true if abc[0] == max_abc[0] / 2 # 終了条件

  log[abc] = depth
  [0, 1, 2].permutation(2).each{|i, j|
    if abc[i] > 0 || abc[j] < max_abc[j]
      next_abc = abc.clone
      move = [abc[i], max_abc[j] - abc[j]].min
      next_abc[i] -= move
      next_abc[j] += move
      return true if search(next_abc, depth + 1, max_abc, log)
    end
  }

  return false
end

cnt = 0
10.step(100, 2){|a|
  (1..(a/2 - 1)).each{|c|
    b = a - c
    if b.gcd(c) == 1  # 最大公約数をCheck
      cnt += 1 if search([a, 0, 0], 0, [a, b, c], {})
    end
  }
}

puts cnt
