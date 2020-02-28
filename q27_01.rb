#! ruby -Ku

# 進方向
@direction = [[1, 0], [0, 1], [-1, 0], [0, -1]]

X = 6
Y = 4

# 道を作る
def make_way(a, b)
  da = a[0] + a[1]
  db = b[0] + b[1]
  if da > db
    return [a, b]
  else
    return [b, a]
  end
end

def move(direction_index, current, history)
  # 範囲外
  return 0 if current[0] > X || current[1] > Y
  return 0 if current[0] < 0 || current[1] < 0

  # ゴール
  return 1 if current[0] == X && current[1] == Y

  cnt = 0
  # 直進
  next_direction = @direction[direction_index]
  next_point = [current[0] + next_direction[0], current[1] + next_direction[1]]
  way = make_way(current, next_point)
  if !history.include?(way)
    history.append(way)
    cnt += move(direction_index, next_point, history)
    history.delete_at(-1)
  end

  # 左折
  next_direction_index = (direction_index + 1) % 4
  next_direction = @direction[next_direction_index]  # 次に曲がる方向
  next_point = [current[0] + next_direction[0], current[1] + next_direction[1]]
  way = make_way(current, next_point)
  if !history.include?(way)
    history.append(way)
    cnt += move(next_direction_index, next_point, history)
    history.delete_at(-1)
  end

  return cnt
end

puts move(0, [0, 0], [])

