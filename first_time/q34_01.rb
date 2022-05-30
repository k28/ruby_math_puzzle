#! ruby -Ku

# 基盤の番数
W = 8
H = 8

# 飛車と角の動きのパターン
@hisha_move = [[0, 1], [0, -1], [1, 0], [-1, 0]]
@kaku_move  = [[1, 1], [1, -1], [-1 , -1], [-1, 1]]

# 基盤に乗っているかチェック
def on_the_board(pos)
  if pos[0] < 0 || pos[0] > W
    return false
  end
  if pos[1] < 0 || pos[1] > H
    return false
  end

  return true
end

# 飛車と角の利きの数を算出する
def hisha_kiki(hisha, kaku)
  kikimemo = []
  # 飛車の動きの利きをチェック
  @hisha_move.each{|d|
    kiki = hisha
    while(true)
      kiki = [kiki[0] + d[0], kiki[1] + d[1]]
      break if on_the_board(kiki) == false
      break if kiki == kaku
      # puts "H " + kiki.inspect
      kikimemo.push(kiki)
    end
  }
  # 角の利きをチェック
  @kaku_move.each{|d|
    kiki = kaku
    while(true)
      kiki = [kiki[0] + d[0], kiki[1] + d[1]]
      break if on_the_board(kiki) == false
      break if kiki == hisha
      next if kikimemo.include?(kiki)
      #puts "K " + kiki.inspect
      kikimemo.push(kiki)
    end
  }

  #puts kikimemo.inspect
  return kikimemo.size
end

# 飛車と角をずらしながら全探索
count = 0
0.upto(W){|hx|
  0.upto(H){|hy|
    0.upto(W){|kx|
      0.upto(H){|ky|
        next if hx == kx && hy == ky
        count += hisha_kiki([hx, hy], [kx, ky] )
      }
    }
  }
}

puts count

