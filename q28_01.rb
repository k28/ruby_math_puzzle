#! ruby -Ku

# クラブに必要な面積と想定人数
clubs = [[11000, 40], [8000, 30], [400, 24], [800, 20], [900, 14], [1800, 16], [1000, 15], [7000, 40], [100, 10], [300, 12]]

# メモ用
@memo = {}

# 必要な面積を計算する
# area : ここまでに必要な面積, remain:残りの人数, remain_clubs : 残りのクラブ
def culc(area, remain, remain_clubs)

  return @memo[[remain_clubs, remain]] if @memo.has_key?([remain_clubs, remain])

  max_area = area
  remain_clubs.each{|c|
    new_remain = remain - c[1]
    if new_remain < 0
      # このクラブを入れると人数オーバー
      next
    end

    # このクラブを入れられる
    total_are = area + c[0]
    # 残りのクラブで再度計算
    total_are = culc(total_are, new_remain, remain_clubs - [c])

    max_area = [total_are, max_area].max
  }

  @memo[[remain_clubs, remain]] = max_area
  return max_area
end

puts culc(0, 150, clubs)

