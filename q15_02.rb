#! ruby -Ku

#
# メモ化して高速処理を目指す
#

N     = 10  # 階段の段数
STEPS = 4   # 一度に進める段数
@memo = {}

def move(a, b)
  return @memo[[a,b]] if @memo.key?([a,b])
  return @memo[[a,b]] = 0 if a  > b
  return @memo[[a,b]] = 1 if a == b

  count = 0
  (1..STEPS).each {|am|
    ap = a + am
    (1..STEPS).each {|bm|
      bp = b - bm
      count += move(ap, bp)
    }
  }

  return @memo[[a,b]] = count
end

puts move(0, 25)

