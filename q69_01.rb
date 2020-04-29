#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

W, H = 5, 6

# 各行の男子の人数を保持
ALL = (1 << W) - 1
@boys = (0..ALL).map{|i| i.to_s(2).count("1")}

# ALL => 横にWだけビットを並べて、1を男子の並びとしている
# puts ALL
# puts (0..ALL).map{|i| i.to_s(2)}.inspect
# puts @boys.inspect

# 3つの行の配置が可能か(上の2行の下に続けられるか)
def check(r1, r2, r3)
  result = true
  W.times{|i|
    m1 = (0b111 << (i - 1)) & ALL  # 左右の並びチェック
    m2 = 1 << i                    # 上下の並びチェック
    # 男子がNGの並びになっているかチェック
    if (r1 & m2 == m2) && (r2 & m1 == m1) && (r3 & m2 == m2)
      result = false
    end
    # 女子がNGの並びになっているかチェック
    if ((r1 ^ ALL) & m2 == m2) && ((r2 ^ ALL) & m1 == m1) && ((r3 ^ ALL) & m2 == m2)
      result = false
    end
  }

  return result
end

# 上の2行に続く行のハッシュを作成
@next = {}
(1 << W).times{|r1|
  (1 << W).times{|r2|
    @next[[r1, r2]] = (0..ALL).select{|r3| check(r1, r2, r3)}
  }
}

@memo = {}
def search(pre1, pre2, line, used)
  if @memo.has_key?([pre1, pre2, line, used])
    return @memo[[pre1, pre2, line, used]]
  end

  if line >= H                  # 最後の行まで探索した
    count = (used == W*H/2) ? 1 : 0
    @memo[[pre1, pre2, line, used]] = count
    return count
  end

  result = 0
  if line == H - 1              # 最終行の直前
    @next[[pre2, pre1]].each{|row|
      if (@next[[row, row]].include?(pre1)) && (used + @boys[row] <= W * H / 2)
        result += search(row, pre1, line + 1, used + @boys[row])
      end
    }
  else                          # 最終行以外
    @next[[pre2, pre1]].each{|row|
      if (used + @boys[row] <= W * H / 2)
        result += search(row, pre1, line + 1, used + @boys[row])
      end
    }
  end

  @memo[[pre1, pre2, line, used]] = result
end

count = 0
# 最初の行のパターン文探索を行う
(1 << W).times{|r0|
  count += search(r0, r0, 1, @boys[r0])
}

puts count

