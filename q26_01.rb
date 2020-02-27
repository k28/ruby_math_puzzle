#! ruby -Ku

W, H = 10, 10
# 駐車場の配置を設定, 周りに番兵として[9]をセット
# 目的の車の位置を2, 
#
# 999999
# 911119
# 921119
# 999999

GUARD  = 9
TAEGET = 2
CAR    = 1

parking = Array.new(W + 2){Array.new(H + 2){CAR}}

# TopとBottomに番兵を設定
(W + 2).times{|w|
  parking[w][0]     = GUARD
  parking[w][H + 1] = GUARD
}

# leading, tailingに番兵を設定
(H + 2).times{|h|
  parking[0][h]     = GUARD
  parking[W + 1][h] = GUARD
}

# ゴールは左上に目的の車がある状態
@goal = Marshal.load(Marshal.dump(parking))
@goal[1][1] = TAEGET

# 開始位置は右下に目的の車がある状態
start = Marshal.load(Marshal.dump(parking))
start[W][H] = TAEGET

# 探索を行う
# @param prev 探索している駐車場の状態
# @@aram depth 現在の探索深度
def search(prev, depth)
  target = []
  prev.each{|parking, w, h|
    # 上下左右に移動
    [[-1, 0], [1, 0], [0, 1], [0, -1]].each{|dw, dh|
      nw, nh = w + dw, h + dh
      if parking[nw][nh] == 9
        next
      end

      # 番兵以外の場合 位置を移動させて、過去に調べていないか確認
      temp = Marshal.load(Marshal.dump(parking))
      temp[w][h], temp[nw][nh] = temp[nw][nh], temp[w][h]
      if @log.has_key?([temp, nw, nh])
        # 過去に調べているのでスキップ
        next
      end

      # 移動したのでtargetに追加して、ログに追加
      target.push([temp, nw, nh])
      @log[[temp, nw, nh]] = depth + 1
    }
  }

  # ゴールに到着したら終了
  return if target.include?([@goal, W, H])
  # 幅優先探索で調査
  search(target, depth + 1) if target.size > 0
end

# 探索ずみを記録
@log = {}
@log[[start, W, H - 1]] = 0
@log[[start, W - 1, H]] = 0

# 開始位置から探索開始
search([[start, W, H - 1], [start, W - 1, H]], 0)

# ゴールまでの探索数を出力
puts @log[[@goal, W, H]]

