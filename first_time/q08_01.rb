#! ruby -Ku

#
# (x, y)
#

def move(current, route, count)
  if count == 0
    return 1
  end

  route.push(current)
  count -= 1

  route_count = 0

  # up
  np = current.clone()
  np[1] += 1
  if route.include?(np) == false
    route_count += move(np, route.clone(), count)
  end

  # down
  np = current.clone()
  np[1] -= 1
  if route.include?(np) == false
    route_count += move(np, route.clone(), count)
  end

  # right
  np = current.clone()
  np[0] += 1
  if route.include?(np) == false
    route_count += move(np, route.clone(), count)
  end

  # left
  np = current.clone()
  np[0] -= 1
  if route.include?(np) == false
    route_count += move(np, route.clone(), count)
  end

  return route_count
end

puts move([0,0], [], 12)

