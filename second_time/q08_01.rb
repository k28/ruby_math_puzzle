#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

N = 12

$move=[[1, 0], [-1, 0], [0, 1], [0, -1]]

def next_point(current, move)
  [current[0] + move[0], current[1] + move[1]]
end

def walk(history)
  return 1 if history.size == (N + 1)

  p = 0
  $move.each do |m|
    next_p = next_point(history[-1], m)
    if !history.include?(next_p)
      p += walk(history + [next_p])
    end
  end

  p
end

total = walk([[0, 0]])
p total

