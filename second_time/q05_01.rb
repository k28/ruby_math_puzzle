
coins = [10, 50, 100, 500]
$max_coin = 15
$target = 1000

# total: ここまでの合計金額, coin_count: ここまでのコインの数, remain_coins: 残りのコインの種類
def walk(total, coin_count, remain_coins)
  return 0 if coin_count > $max_coin
  return 1 if total == $target
  return 0 if total > $target
  return 0 if remain_coins.empty?

  count = 0
  coin = remain_coins.pop
  # p "#{total}, #{coin}, #{remain_coins}"
  can_use_coins = $max_coin - coin_count
  (0..can_use_coins).each do |n|
    current_total = total + (coin * n)
    count = count + walk(current_total, coin_count + n, remain_coins.dup)
  end

  count
end

p walk(0, 0, coins)

