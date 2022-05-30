#! ruby -Ku

@country = [ "Brazil", "Croatia", "Mexico", "Cameroon", "Spain", "Netherlands", "Chile", "Australia",
              "Colombia", "Greece", "Cote d'lvoire", "Japan", "Uruguay", "Costa Rica", "England",
              "Italy", "Switzerland", "Ecuador", "France", "Honduras", "Argentina", "Bosnia and Herzegovina",
              "Iran", "Negeria", "Germany", "Portugal", "Ghana", "USA", "Belgium", "Algeria", "Russia", "Korea Republic"]

# 使用済みかチェック
@is_used = Array.new(@country.size, false)

def search(prev, depth)
  # 一旦ここで終了にしておく
  is_last = true

  # 国でループ
  @country.each_with_index{|c, idx|
    if c[0] == prev[-1].upcase
      if !@is_used[idx]
        # しりとりを続けられるので、この国で最後じゃない
        is_last = false
        @is_used[idx] = true
        search(c, depth+1)
        @is_used[idx] = false
      end
    end
  }

  # 深さを更新
  @max_depth = [@max_depth, depth].max if is_last
end

# すべての国を起点に順に検索
@max_depth = 0
@country.each_with_index{|c, idx|
  @is_used[idx] = true
  search(c, 1)
  @is_used[idx] = false
}

puts @max_depth

