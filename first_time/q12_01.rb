#! ruby -Ku

# 整数部分を含む場合
i = 1
while i += 1
  # 小数点を除去し、左から10文字取得
  str = ('%10.10f'%Math.sqrt(i)).sub('.', '')[0..9]
  # 重複を取り除いて10文字なら終了
  break if str.split('').uniq.length == 10
end
puts i

# 整数部分を含まない場合
i = 1
while i += 1
  # 小数点で分割して右だけ取得
  str = ('%10.10f'%Math.sqrt(i)).split('.')[1]
  # 重複を取り除いて10文字なら終了
  break if str.split('').uniq.length == 10
end
puts i


