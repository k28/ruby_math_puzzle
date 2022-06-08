
def cutbar(m, n, current) # currentは現在の棒の数
  if current >= n
    0
  elsif current < m
    # 棒の数が人数よりも少ない時には、全員切るので棒の長さは2倍になる
    1 + cutbar(m, n, current * 2)
  else 
    # 棒の数が人数よりも多い時には、人数の数だけ増える
    1 + cutbar(m, n, current + m)
  end
end

p cutbar(3, 20, 1)
p cutbar(5, 100, 1)

