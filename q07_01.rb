#! ruby -Ku

# 1. YYYYMMDD
# 2. 2進数に変換
# 3. 逆に並べる
# 4. 10進数に戻す

require "date"

start_date = Date.new(1964, 10, 10)
#start_date = Date.new(2020,  6, 10)
end_date   = Date.new(2020,  7, 24)

count = 0

current_date = start_date
while(current_date != end_date)

  str  = current_date.strftime("%Y%m%d")
  val10 = str.to_i
  val2 = val10.to_s(2)
  rev2 = val2.reverse()
  rev10 = rev2.to_i(2)

  if val10 == rev10
    puts "#{str}, #{rev10}"
    count += 1
  end

  # 1日進める
  current_date = current_date + 1
end

puts count


