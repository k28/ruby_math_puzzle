
def collatz_problem(val, first)
  return true  if val == first
  return false if val == 1

  if val.even?
    collatz_problem(val / 2, first)
  else
    collatz_problem((val * 3) + 1, first)
  end
end

# 2〜10000までの偶数に対して、初回のみ(n * 3) + 1 して元の数に戻るものの数を調べる
p 2.step(10000, 2).count { |i|
  collatz_problem((i * 3) + 1, i)
}

