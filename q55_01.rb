#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

N = 10

#
# 使った数字の位置をbitで覚える
# 1,3,5  => 0b000000010101

# 元の数に加算した場合に移動する量を返す
def move(bit, add)
  base = 0
  N.times{|i|
    base += i + 1 if (bit & (1 << i)) > 0
  }

  # 10の位の5の玉の位置を確認
  a0, a1 = (base + add).divmod(50)
  b0, b1 = base.divmod(50)

  # 10の位の1の玉の位置を確認
  a2, a3 = a1.divmod(10)
  b2, b3 = b1.divmod(10)

  # 1の位の玉の位置を確認
  a4, a5 = a3.divmod(5)
  b4, b5 = b3.divmod(5)

  # 全ての位置の差から動かす量を加算
  return (a0 - b0).abs + (a2 - b2).abs + (a4 - b4).abs + (a5 - b5).abs
end

@memo = Hash.new(10)
@memo[(1 << N) - 1] = 0

# 10まで足した時の移動量が最小になる時を求める

def search(bit)
  return @memo[bit] if @memo.has_key?(bit)
  min = 1000
  N.times{|i|
    if bit & (1 << i) == 0
      # 今の時点からの最小の移動量を算出
      tmp = move(bit, i + 1) + search(bit | (1 << i))
      # 小さい方を採用
      min = [min, tmp].min
    end
  }

  @memo[bit] = min
  return min
end

# 初期状態から開始
puts search(0)

