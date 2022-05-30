#! ruby -Ku

D0 = 0b1111110
D1 = 0b0110000
D2 = 0b1101101
D3 = 0b1111001
D4 = 0b0110011
D5 = 0b1011011
D6 = 0b1011111
D7 = 0b1110000
D8 = 0b1111111
D9 = 0b1111011

patterns = [D0, D1, D2, D3, D4, D5, D6, D7, D8, D9]

# 排他的論理和の結果を先に算出する
flip = Array.new(10)
(0..9).each{|i|
  flip[i] = Array.new(10)
  (0..9).each{|j|
    flip[i][j] = (patterns[i] ^ patterns[j]).to_s(2).count("1")
  }
}

min = 63  # 毎回ビットを判定させた時の値
(0..9).to_a.permutation(10){|p|
  sum = 0
  (p.size - 1).times{|j|
    sum += flip[p[j]][p[j+1]]
  }
  min = sum if sum < min
}

puts min

