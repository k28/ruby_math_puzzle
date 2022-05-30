#!ruby -Ku

count = 0   # 0が出現した数
line  = 1   # 現在の行
row   = [1] # 現在の行の値
N = 2014

while count < N
  next_row = [1]
  # 前行から排他的論理和で次の行をセット
  (row.size - 1).times{|i|
    cell = row[i] ^ row[i + 1]  # 配列のindexが存在しない場合はnilが取得できる
    next_row.push(cell)
    count += 1 if cell == 0     # 0の場合にカウントあっぷ
  }
  next_row.push(1)
  line += 1
  row = next_row
end

puts line

