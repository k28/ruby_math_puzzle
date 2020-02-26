#! ruby -Ku

# 右側、左側それぞれの穴に0から番号を割り当てる
# 交差の条件は番号の大小が逆転する時

# 片側の穴の数
N = 6

max_cnt = 0
(1..N - 1).to_a.permutation(N - 1){|l|
  (1..N - 1).to_a.permutation(N - 1){|r|
    # 経路を設定
    path  = []
    left  = 0     # 左上から始める
    right = r[0]  # 右側の初めの穴
    (N - 1).times{|i|
      # 左 -> 右
      path.push([left, right])
      left = l[i]
      # 右 -> 左
      path.push([left, right])
      right = r[i + 1]
    }

    # 最後に右上に戻す
    path.push([left, 0])

    cnt = 0
    # 経路が交差しているかを判定
    (path.size - 1).times{|i|
      (i + 1).upto(path.size - 1){|j|
        cnt += 1 if (path[i][0] - path[j][0]) *
                    (path[i][1] - path[j][1]) < 0
      }
    }

    max_cnt = [max_cnt, cnt].max
  }
}

puts max_cnt

