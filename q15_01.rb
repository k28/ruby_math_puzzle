#! ruby -Ku

N     = 10  # 階段の段数
STEPS = 4   # 一度に進める段数

def move(a, b)
  return 1 if a == b
  return 0 if a > b

  count = 0
  (1..STEPS).each {|am|
    ap = a + am
    (1..STEPS).each {|bm|
      bp = b - bm
      count += move(ap, bp)
    }
  }

  return count
end

puts move(0, 10)

