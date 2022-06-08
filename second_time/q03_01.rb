
cards = Array.new(100, false)

(2..100).each do |n|
  (0..99).each do |c|
    if (c + 1) % n == 0
      cards[c] = !cards[c]
    end
  end
end

(0..99).each { |i| p i + 1 if !cards[i] }

