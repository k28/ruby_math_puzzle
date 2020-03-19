#! ruby -Ku

# 反転するマスクを設定
mask = Array.new(16)
4.times{|row|
  4.times{|col|
    # 縦と横のマスクになるようにビットを設定する
    mask[row*4 + col] = (0b1111 << (row*4) | (0b1000100010001 << col))
  }
}

max = 0
# ステップ数を保存する配列
# 4 x 4 の升目のパターンは16ビットで表せるので、全てのパターンを初期値(-1)にしておく
steps = Array.new(1 << 16, -1)
# 全て白からスタートするので0で初期化
steps[0] = 0
# 調査対象の配列(0:全て白 からスタート)
scanner = [0]
while scanner.size > 0 
  check = scanner.shift
  next_steps = steps[check] + 1
  16.times{|i|
    n = check ^ mask[i]
    # 未チェックの場合、さらに調査する
    if steps[n] == -1
      steps[n] = next_steps
      scanner.push(n)
      max = next_steps if max < next_steps
    end
  }
end

puts max  # 最大ステップ数
puts steps.index(max).to_s(2) # 初期状態のマス目
p steps.select{|i| i == -1}   # 白にならない初期状態はない

