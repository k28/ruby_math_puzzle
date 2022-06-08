
# 棒を連結していくと考えるパターン

def cutbar(m, n)
  count = 0
  # 現在の長さ
  current = 1
  while n > current do
    current += current < m ? current : m
    count = count + 1
  end

  p count
end

cutbar(3, 20)

