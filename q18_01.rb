#! ruby -Ku

def check(n, pre, log, square)
  if n == log.size
    # 全てセットした場合
    if square.include?(1 + pre)
      # 1と直前の数の和が平方数の場合
      puts n
      p log
      return true
    end
  else
    # 使用していない数でループ
    # (1..n).to_aで1からnまでの配列を作成 [1, 2, 3, .. , n]
    # - logで logに含まれる要素を削除する
    ((1..n).to_a - log).each{|i|
      if square.include?(pre + i)
        # 直前の数との和が平方数の場合
        return true if check(n, i, log + [i], square)
      end
    }
  end

  # このパターンはダメだった
  return false
end

n = 2
while true do
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  break if check(n, 1, [1], square)
  n += 1
end


