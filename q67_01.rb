#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

#
# 白ます: 0, 黒ます: 1, 番兵: -1
#

W, H = 6, 5
# 升目の初期化(番兵を周りに置くために実サイズよりも2大きく作成している)
@puzzle = Array.new(W + 2).map{Array.new(H + 2, 0)}
(W + 2).times{|w|
  (H + 2).times{|h|
    if (w == 0) || (w == W+1) || (h == 0) || (h == H+1)
      @puzzle[w][h] = -1
    end
  }
}

# 連続チェック用に埋めていく
# x, y 座標
# from から toに埋める
def fill(x, y, from, to)
  if @puzzle[x][y] == from
    @puzzle[x][y] = to
    fill(x - 1, y, from, to)
    fill(x + 1, y, from, to)
    fill(x, y - 1, from, to)
    fill(x, y + 1, from, to)
  end
end

def check()
  x, y = 1, 1
  x += 1 if @puzzle[x][y] == 1
  fill(x, y, 0, 2)  # 白ますをダミーで埋める
  result = (@puzzle.flatten.count(0) == 0)
  fill(x, y, 2, 0)  # 元に戻る
  return result
end

def search(x, y)
  x, y = 1, y + 1 if x == W + 1 # 右端に到達したら次の行
  return 1 if y == H + 1    # 最後まで探索できれば成功

  cnt = search(x + 1, y)    # 白ますをセットして次を探索

  # 左か上が黒マス以外の場合黒ますをセットして次を探索
  if (@puzzle[x - 1][y] != 1)  && (@puzzle[x][y - 1] != 1)
    @puzzle[x][y] = 1         # 黒ますをセット
    cnt += search(x + 1, y) if check()
    @puzzle[x][y] = 0         # 黒ますを戻す
  end
  return cnt
end

# 左上から開始
puts search(1, 1)

