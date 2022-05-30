#! ruby -Ku

#
# 同じ道を通らずに往復する
#

SQUARE = 6
@count = 0

@is_used = Array.new(SQUARE + 1){Array.new(SQUARE + 1){[false, false]}}

def route(x, y, is_first_time)
  if (x == SQUARE) && (y == SQUARE)
    if is_first_time
      route(0, 0, false)
    else
      @count += 1
    end
  end

  if x < SQUARE
    if !@is_used[x][y][0]
      @is_used[x][y][0] = true
      route(x + 1, y, is_first_time)
      @is_used[x][y][0] = false
    end
  end

  if y < SQUARE
    if !@is_used[x][y][1]
      @is_used[x][y][1] = true
      route(x, y + 1, is_first_time)
      @is_used[x][y][1] = false
    end
  end
end

route(0, 0, true)
puts @count

