#! ruby -Ku

EURO = [0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26]
US   = [0, 28, 9, 26, 30, 11, 7, 20, 32, 17, 5, 22, 34, 15, 3, 24, 36, 13, 1, 0, 27, 10, 25, 29, 12, 8, 19, 31, 18, 6, 21, 33, 16, 4, 23, 35, 14, 2]

# argの中で連続するnこの数値が最も大きくなるものを調べる
def search_max(n, arg)
  # 始めのMax
  total = 0
  n.times{|i|
    total += arg[i]
  }
  max = total

  for i in n...(arg.size + n)
    total -= arg[(i - n) % arg.size]
    total += arg[i % arg.size]

    max = total if total > max
  end

  return max
end

total = 0
for i in 2..36
  total += 1 if search_max(i, EURO) < search_max(i, US)
end

puts total


