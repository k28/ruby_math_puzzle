#! ruby -Ku

# m : 人数
# n : 長さ
# current : 棒の数
def cut(m, n, current) 
  if current >= n
    return 0
  elsif current < m
    return 1 + cut(m, n, current * 2)
  else
    1 + cut(m, n, current + m)
  end
end

puts cut(3, 20, 1)

