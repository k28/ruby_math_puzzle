#! ruby -Ku

cards = []

for i in 0..100
  cards[i] = false
end

for i in 2..100
  j = i - 1
  while j < 100
    cards[j] = !cards[j]
    j += i
  end
end

for i in 0...100
  if cards[i] == false
    puts i + 1
  end
end

