#! ruby -Ku

#
# 再起処理で書き直したパターン
#

@found = false
@op = ['+', '-', '*', '/', '']

def check(n ,expr, num)
  if n == 0
    if eval(expr) == 1234
      puts expr
      @found = true
    end
  else
    @op.each{|o|
      check(n - 1, "#{expr}#{o}#{num}", num)
    }
  end
end

len = 1
while !@found
  (1..9).to_a.each{|i|
    check(len, i, i)
  }
  len += 1
end

