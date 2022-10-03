#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

def arrival(m_remain, f_remain, m_total, f_total)
  # ここまでで同数の場合はカウントしない
  if (m_total > 0 && f_total > 0) && (m_total == f_total)
    return 0
  end

  # 残りが同数の場合もカウントしない
  if (m_remain > 0 && f_remain > 0 ) && (m_remain == f_remain)
    return 0
  end

  # 最後まで並べた
  if m_remain == 0 && f_remain == 0 
    return 1
  end

  # 並べて、数を数える
  total = 0
  if m_remain > 0
    # 男がきた時
    total += arrival(m_remain - 1, f_remain, m_total + 1, f_total)
  end

  if f_remain > 0 
    # 女性がきた時
    total += arrival(m_remain, f_remain - 1, m_total, f_total + 1)
  end

  total
end

t = arrival(20, 10, 0, 0)
puts "#{t}"

