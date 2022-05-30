#! ruby -Ku

# メモ化して高速化する
@memo = {}

def game(coin, count)
  # gameover
  return 0 if coin <= 0
  # 試行回数に達した
  return 1 if count == 0
  # キャッシュにあればそれを返す
  return @memo[[coin, count]] if @memo.key?([coin, count])

  total = 0
  # 勝った時
  total += game(coin + 1, count - 1)
  # 負けた時
  total += game(coin - 1, count - 1)

  @memo[[coin, count]] = total
  return total
end

puts game(10, 24)

