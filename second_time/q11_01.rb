#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

def isDividable(x)
  sum = x.to_s.split('').inject(0) {|result, n| result + n.to_i}
  return x % sum == 0
end

count = 0
a, b = 1, 2
while count < 11
  tmp = b
  b = (a + b)
  a = tmp
  if isDividable(a)
    count += 1
    puts a
  end
end

