#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

N = 8 # 砂時計の数
GOAL = [1] * N  # 最終的に全ての砂時計が1になれば同時に下に落ちる

count = 0
(1..N).to_a.permutation{|init|
  hourglass = init
  pos = 0
  log = {} # 同じ状態になるかチェックするログ 
  while log[hourglass] != pos

    # 目標の形に達したら終了
    if hourglass == GOAL
      count += 1
      break
    end
    log[hourglass] = pos

    # 砂時計を減らす
    hourglass = hourglass.map{|h| h > 0 ? h - 1 : 0}
    # 砂時計を反転
    init[pos].times{|i|
      rev = (pos + i) % N
      hourglass[rev] = init[rev] - hourglass[rev]
    }

    # 次の位置に移動
    pos = (pos + 1) % N

  end
}

puts count

