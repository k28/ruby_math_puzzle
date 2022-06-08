
n = 100
m = 5

# list: 棒の長さ, n: 何人できるか, current: 現在の回数
def cut(list, n, current)
  if list.length == 0
    return current
  end
  bars = []
  scissors = n
  # listは降順にソートしてから実施しないと、cutの処理に無駄が生じる
  list.sort!.reverse!
  list.each do |b|
    if scissors > 0
      a1 = (b/2)
      a2 = b-a1
      bars.append(a1) if a1 > 1 # 切れない物は含めない
      bars.append(a2) if a2 > 1
      scissors -= 1
    else
      bars.append(b)
    end
  end

  # p "cut #{bars}"
  return cut(bars, n, current+1)
end

p cut([20], 3, 0)
p cut([100], 5, 0)

