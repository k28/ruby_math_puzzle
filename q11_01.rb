#! ruby -Ku

# 引数の文字列を分解して和を求める
def make_val_sum(n)
  total = 0
  for i in 0...n.size
    total += n[i].to_i()
  end

  return total
end

# 初期値
s = b = 1
counter = 0

while counter < 11
  # フィボナッチ数列を計算
  n = s + b

  # 値をスライドさせる
  s, b = b, n

  # 数値を分解した和を求める
  total = make_val_sum(n.to_s)
  if n % total == 0
    puts "#{n}"
    counter += 1
  end
end


