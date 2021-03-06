#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

N = 5
# 右手法の移動方法
@dx = [[1, 0], [0, -1], [-1, 0], [0, 1]]

# maze: 壁の配置
# p1, d1: 1人目の経路、移動方向
# p2, d2: 2人目の経路、移動方向
def search(maze, p1, d1,  p2, d2)
  if p1.size == p2.size
    # であった場合は成功
    return true  if p1[-1][0..1] == p2[-1][0..1]
    # 1が右下についた
    return false if p1[-1][0..1] == [N - 1, N - 1]
    # 2が左上についた
    return false if p2[-1][0..1] == [0, 0]
  end
  # 同じ方向から起動してきた場合はループなので失敗
  return false if p1.count(p1[-1]) > 1

  pre = p1[-1]
  @dx.size.times{|i|
    d = (d1 - 1 + i) % @dx.size
    px = pre[0] + @dx[d][0]
    py = pre[1] + @dx[d][1]
    # 移動先が壁になっていないかチェック
    if (px >= 0) && (px < N) && (py >= 0) && (py < N) && (maze[px + N * py] == 0)
      return search(maze, p2, d2, p1 + [[px, py, d]], d)
    end
  }

  return false
end

a = [[0, 0, -1]]          # A:左上(X座標, Y座標, 前の移動方向)
b = [[N - 1, N - 1, -1]]  # B:右下(X座標, Y座標, 前の移動方向)

cnt = 0
[0, 1].repeated_permutation(N * N - 2){|maze|
  # 2人の開始位置は必ず通路として探索
  # Aは下に移動(@dx[3]), Bは上(@dx[1])に移動 (座標系が左上原点)
  cnt += 1 if search([0] + maze + [0], a, 3, b, 1)
}

puts cnt

