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

min = 63  # 毎回ビットを判定させた時の値
patterns.permutation(patterns.size){|p|
  sum = 0
  (p.size - 1).times{|j|
    sum += (p[j] ^ p[j+1]).to_s(2).count("1")
  }
  min = sum if sum < min
}

puts min


