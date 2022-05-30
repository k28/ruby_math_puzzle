#! ruby -Ku

# 2枚抜きの可能性がある抜き方をセット
board = [[1, 2], [2, 3], [3, 6], [6, 9], [9, 8], [8, 7], [7, 4], [4, 1]]

# 1枚抜きの方法を追加
1.upto(9){|i|
  board.push([i])
}


@memo = {}

def struckout(board)
  return 1 if board.size == 0
  return @memo[board] if @memo.has_key?(board)

  cnt = 0
  board.each{|b|
    # bの的を抜いた事にする
    # 抜いた的に含まれる数字がある抜き方は除外
    # 配列と配列のAND演算を行うと、複数の配列に共通する要素を取得できる
    # size == 0にする事でbに含まれる値をboardから除外した物をnext_boardにセットする
    next_board = board.select{|i| (b & i).size == 0}
    cnt += struckout(next_board)
  }

  @memo[board] = cnt
  return cnt
end

puts struckout(board)

