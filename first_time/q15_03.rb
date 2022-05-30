#! ruby -Ku

#
# 動的計画法
#

N = 10    # 段数
STEPS = 4 # 一度に進める段数

dp = Array.new(N + 1, 0)  # t回の移動で移動した位置を集計
cnt = 0
dp[N] = 1                 # 初期値をセット

# 移動した表を作成しながらパターンを調べる
N.times{|i|
  (N + 1).times{|j| 
    (1..STEPS).each{|k|
      break if k > j
      dp[j - k] += dp[j]
    }
    dp[j] = 0 # 移動元はクリア
  }

  # puts dp.join(",") # 表を出力
  cnt += dp[0] if i % 2 == 1  # 偶数回の移動で逆に到着
}

puts cnt

