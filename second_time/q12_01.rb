#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

def num_to_str(v)
  return '%10.10f'%v
end

i = 1
while i += 1
  str = num_to_str(Math.sqrt(i)).sub('.', '')[0..9]
  if str.split('').uniq.length == 10
    pp i
    break
  end
end

i = 1
while i += 1
  str = num_to_str(Math.sqrt(i)).split('.')[1]
  if str.split('').uniq.length == 10
    pp i
    break
  end
end

