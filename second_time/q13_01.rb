#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# READ + WRITE + TALK = SKILL
#
# R E A D W I T L S K 
# R W T S != 0
#



def check(list)
  r, e, a, d, w, i, t, s, l, k = list
  return if (r == 0 or w == 0 or t == 0 or s == 0)

  read  = r * 1000 + e * 100 + a * 10 + d
  talk  = t * 1000 + a * 100 + l * 10 + k
  write = w * 10000 + r * 1000 + i * 100 + t * 10 + e
  skill = s * 10000 + k * 1000 + i * 100 + l * 10 + l
  if (read + write + talk) == skill
    pp "#{read} + #{write} + #{talk} = #{skill}"
  end
end

[0,1,2,3,4,5,6,7,8,9].permutation do |e|
  check(e)
end

