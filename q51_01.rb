#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

def suffle(cards)
  left  = cards.take(cards.size / 2)
  right = cards.drop(cards.size / 2)
  result = []
  left.size.times{|i|
    result.push(left[i])
    result.push(right[i])
  }

  return result
end


count = 0
(1..100).each{|n|
  init = (1..(2 * n)).to_a
  cards = init.clone
  (2 * (n - 1)).times{|i|
    cards = suffle(cards)
  }

  count += 1 if init == cards
}

puts count

