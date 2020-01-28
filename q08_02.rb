#! ruby -Ku

N = 12

def move(log)
  # 最初の位置を含んで, N+1個調べれば終了
  return 1 if log.size == N + 1

  cnt = 0
  # 前後左右に移動
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each {|d|
    # logの最後に前回の場所が入っている
    next_pos = [log[-1][0] + d[0], log[-1][1] + d[1]]
    if log.include?(next_pos) == false
      cnt += move(log + [next_pos])
    end
  }

  return cnt
end

# 開始位置も配列で入れる
puts move([[0, 0]])

