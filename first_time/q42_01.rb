#! ruby -Ku

op = ['+', '-', '*', '/', '']
found = false
len = 1
while !found
  op.repeated_permutation(len){|o|
    (1..9).to_a.each{|i|
      expr = o.inject(i.to_s){|l, n| l + n + i.to_s}
      if eval(expr) == 1234
        puts expr
        found = true
      end
    }
  }

  len += 1
end

