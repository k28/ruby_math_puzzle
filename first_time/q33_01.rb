#! ruby -Ku

#
# 実行方法
# $ ruby q33_01.rb q33.csv

# 集計フィールド
@count = 0

# 再帰的に検索
def search(list, len)
  if list.length == 1
    # 一意に識別できた時
    @count += len - 1
  else
    # 複数存在する時, 1字増やして調査
    list.uniq{|x| x[0, len]}.each{|k|
      search(list.select{|x| x.start_with?(k[0, len])}, len + 1)
    }
  end
end

# CSVファイルから「かな」の列を配列にセットし
# 上の句は上の句で処理、下の句は下の句で処理するために転置する
$<.drop(1).map{|e| e.split(',')[3, 2]}.transpose.each{|ku|
  search(ku, 1)
}

puts @count

