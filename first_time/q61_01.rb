#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# 盤面のサイズ
W, H = 5, 4

# 隣あった色があるか確認する
# 確認した色は削除する
def check(color, del)
  color.delete(del)
  # 移動先をセット
  left, right, up, down = del - 1, del + 1, del - W, del + W
  # 移動方向に同じ色があればその方向を探索
  check(color, left)  if (del % W > 0)      && color.include?(left)
  check(color, right) if (del % W != W - 1) && color.include?(right)
  check(color, up)    if (del / W > 0)      && color.include?(up)
  check(color, down)  if (del / W != H - 1) && color.include?(down)
end

# 盤面の初期化
map = (0..(W*H-1)).to_a
count = 0
# 半分を青にして検索
map.combination(W * H / 2){|blue|
  # 右上を青に固定
  if blue.include?(0)
    # 残りが白
    white = map - blue
    # 青がつながっているか
    check(blue, blue[0])
    # 白がつながっているか
    check(white, white[0]) if blue.size == 0
    # 両方つながっていればカウントアップ
    count += 1 if white.size == 0
  end
}

puts count

