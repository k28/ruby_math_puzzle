#! ruby -Ku

PLACE = 100000

# i番目のの数だけ先頭から取り出して後ろにつけるを繰り返す
def round(num)
  first = num / PLACE
  1.upto(first){|i|
    # i番目を裏返して後ろにつける
    val = num / PLACE
    num = (num - (val * PLACE)) * 10 + (7 - val)
  }

  return num
end

not_loop = []
111111.upto(666666){|i|
  # サイコロの名に含まれない数が入っている場合はスキップ
  strval = i.to_s
  next if strval.include?('0')
  next if strval.include?('7')
  next if strval.include?('8')
  next if strval.include?('9')
  roop = [i]
  round_val = i
  while true
    round_val = round(round_val)
    if roop.include?(round_val)
      # ループした数値が0番目でない場合はカウントする数値
      if roop.find_index(round_val) != 0
        not_loop << i
      end

      break
    end
    roop << round_val
  end
}

puts not_loop.size
