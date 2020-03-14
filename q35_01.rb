#! ruby -Ku

# 道の数
N = 6

@cnt = 0

def search(man_x, man_y, woman_x, woman_y, meet)
  if (man_x <= N) && (man_y <= N) &&
      (woman_x >= 0) && (woman_y >= 0)
    @cnt += 1 if (man_x == N) && (man_y == N) && (meet >= 2)
    # 同じライン状ですれ違い(同じポイントで出会うとmeet=2になる)
    meet += 1 if (man_x == woman_x)
    meet += 1 if (man_y == woman_y)
    # 最短距離で向かうのでそれぞれの動きは4パターン
    search(man_x + 1, man_y    , woman_x - 1, woman_y    , meet)
    search(man_x + 1, man_y    , woman_x    , woman_y - 1, meet)
    search(man_x    , man_y + 1, woman_x - 1, woman_y    , meet)
    search(man_x    , man_y + 1, woman_x    , woman_y - 1, meet)
  end
end

search(0, 0, N, N, 0)
puts @cnt

