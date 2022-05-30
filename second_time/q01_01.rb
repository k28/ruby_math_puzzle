
n = 11
while true
  if (n.to_s(10) == n.to_s(10).reverse) &&
     (n.to_s(8) == n.to_s(8).reverse) &&
     (n.to_s(2) == n.to_s(2).reverse)

    p n
    break
  end

  #  奇数だけを検索すれば良いので、2ずつ増やす (2進数で回文になるには最後が1である必要があるため)
  n += 2
end
