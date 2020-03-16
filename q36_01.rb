#! ruby -Ku

# 2の倍数と5の倍数は桁の最後が必ず0または5になるので対象から省く
n = (1..50).select{|i| (i % 2 > 0) || (i % 5 > 0) }

answer = Array.new
k = 1
while(n.size > 0)
  # 0と7からなる数値を作成する
  x = k.to_s(2).to_i * 7
  k += 1  # 次のために+1しておく

  # 0を含む場合のみにする (7のみの場合は排除する, 排除しない場合は以下のifを削除する)
  if x.to_s.include?('0') == false
    next
  end

  n.each{|i|
    if x % i == 0
      # 回文になっていたらanswerにも入れる
      answer << i if x.to_s == x.to_s.reverse
      n.delete(i)
    end
  }
end

puts answer.sort

