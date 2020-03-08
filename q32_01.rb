#!ruby -Ku

HEIGHT = 4
WIDTH  = 7
@str = "";
@tatami = Array.new(HEIGHT + 2){Array.new(WIDTH + 2){0}}

# 外周に-1をセット, 内部は0をセット
0.upto(HEIGHT + 1){|h|
  0.upto(WIDTH + 1){|w|
    if h == 0 || w == 0 || h == HEIGHT + 1 || w == WIDTH + 1
      @tatami[h][w] = -1
    end
  }
}

# 初期値をデバッグ表示
# puts @tatami.inspect

# タタミを表示する
def print_tatami()
  1.upto(HEIGHT){|h|
    1.upto(WIDTH){|w|
      if (@tatami[h][w] == @tatami[h][w + 1]) || (@tatami[h][w] == @tatami[h][w - 1])
        @str += "-"
      end
      if (@tatami[h][w] == @tatami[h + 1][w]) || (@tatami[h][w] == @tatami[h - 1][w])
        @str += "|"
      end
    }
    @str += "\n"
  }
  @str += "\n"
end

# 再帰的に畳をセット
# 再帰的に探索していくけど、置けなくなった場合は何もしない
def set_tatami(h, w, id)
  if h == HEIGHT + 1
    # 最終行の場合は畳を表示
    print_tatami()
  elsif w == WIDTH + 1
    # 右端の場合は次の行に移動
    set_tatami(h + 1, 1, id)
  elsif @tatami[h][w] > 0
    # すでにセット済みの場合は右に移動
    set_tatami(h, w + 1, id)
  else
    # 左上と上が同じ場合、左上と左が同じ場合はセット可能
    if (@tatami[h - 1][w - 1] == @tatami[h - 1][w]) ||
       (@tatami[h - 1][w - 1] == @tatami[h][w - 1])
      if @tatami[h][w + 1] == 0
        # 横にセット可能な場合
        @tatami[h][w] = @tatami[h][w + 1] = id
        set_tatami(h, w + 2, id + 1)
        @tatami[h][w] = @tatami[h][w + 1] = 0
      end
      if @tatami[h + 1][w] == 0
        # 縦にセット可能
        @tatami[h][w] = @tatami[h + 1][w] = id
        set_tatami(h, w + 1, id + 1)
        @tatami[h][w] = @tatami[h + 1][w] = 0
      end
    end
  end

end

set_tatami(1, 1, 1)
puts @str

