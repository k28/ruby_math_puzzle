#!ruby -Ku

#
# 最短経路問題として解く
#

boy, girl = 20, 10
boy, girl = boy + 1, girl + 1
ary = Array.new(boy * girl){0}  # 2次元配列を1次元の配列で表す
ary[0] = 1

# 経路のパターンを算出する
girl.times{|g|
  boy.times{|b|
    # 考慮しない状態は計算しない(0のままになる)
    # 現在の場所の経路は左と下の和になる
    if (b != g) && (boy - b != girl - g)
      ary[b + boy * g] += ary[b - 1 + boy * g]   if b > 0
      ary[b + boy * g] += ary[b + boy * (g - 1)] if g > 0
    end
  }
}

# 経路図を表示する
#for i in 0...ary.size
#  print sprintf("%8d", ary[i])
#  if (i + 1) % (boy) == 0
#    print("\n")
#  end
#end

# ary[-boy - 1] => 0  ここに到達するパターンはない
puts ary[-2] + ary[-boy - 1]


