#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

#
# !! 実行に30秒ほどかかります
#

# ゴールとして初期値を設定
memo = {0x000fff => 0, 0xfff000 => 0, 0xcccccc => 0, 0x333333 => 0}
queue = memo.keys
W, H = 4, 6

# 交換可能な位置を設定
mask = []
(W * H).times{|i|
  mask.push((1 << 1 | 1) << i) if i % W < W - 1   # 横に隣あう
  mask.push((1 << W | 1) << i) if i < W * (H - 1) # 縦に隣あう
}

depth = 0
while queue.size > 0
  p [depth, queue.size]
  depth += 1
  next_queue = []
  queue.map{|q|
    mask.each{|m|
      # 2箇所が[両方0]か[両方1]の場合以外で未探索の部分を探索
      if ((q & m) != 0) && ((q & m) != m) && !memo.key?(q ^ m)
        memo[q ^ m] = depth
        next_queue.push(q ^ m)
      end
    }
  }

  queue = next_queue
end

