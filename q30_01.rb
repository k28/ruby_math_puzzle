#! ruby -Ku

N = 20

@memo = {1 => 1}

def set_tap(remain)
  return 1 if remain == 1
  return @memo[remain] if @memo.has_key?(remain)

  cnt = 0
  # 2口を接続
  (1..(remain/2)).each{|i|
    if remain - i == i
      # 左右の口に同じ数になるようにタップを接続する
      # パターンはset_tap(i)あるけど、組み合わせで重複するものは省く必要がある
      # nH2 = (n+2-1)C2
      cnt += set_tap(i) * (set_tap(i) + 1) / 2
    else
      cnt += set_tap(remain - i) * set_tap(i)
    end
  }

  # 3口を接続
  (1..(remain / 3)).each{|i|
    (i..((remain - i) / 2)).each{|j|
      # 3このコンセントの口の数の組み合わせで重複を排除して計算する必要がある
      if (remain - (i + j) == i) && (i == j)
        # 全ての口に同じ数になるように接続するパターン
        cnt += set_tap(i) * (set_tap(i) + 1) * (set_tap(i) + 2) / 6
      elsif remain - (i + j) == i
        cnt += set_tap(i) * (set_tap(i) + 1) * set_tap(j) / 2
      elsif i == j
        cnt += set_tap(remain - (i+j)) * set_tap(i) * (set_tap(i) + 1) / 2
      elsif remain - (i + j) == j
        cnt += set_tap(j) * (set_tap(j) + 1) * set_tap(i) / 2
      else
        cnt += set_tap(remain - (i+j)) * set_tap(i) * set_tap(j)
      end
    }
  }

  @memo[remain] = cnt
  return cnt
end

puts set_tap(N)

