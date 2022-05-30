#! ruby -Ku

# 問題の通りに考えてみるパターン
N = 9
@max = 0
@max_list = Hash.new

# 並べ替えを実施
# cards : カードの並び
# init  : 初期のカードの並び
# depth : 並べ替えの回数
def solve(cards, init ,depth)
  if cards[0] == 1
    if @max < depth
      @max = depth
      @max_list.clear
    end

    @max_list[init] = cards if @max == depth
  else
    # 並べ替えを継続
    rev_cards = cards[0..(cards[0] - 1)].reverse + cards[cards[0]..N]
    solve(rev_cards, init, depth + 1)
  end
end

def pattern(used, unused, index)
  if unused.empty?
    solve(used, used, 0)
  else
    unused.select{|i| index + 1 != i}.each{|i|
      pattern(used + [i], unused - [i], index + 1)
    }
  end
end

pattern([], (1..N).to_a, 0)
puts @max
puts @max_list

