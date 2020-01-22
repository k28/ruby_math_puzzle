#! ruby -Ku
#
# Q02
#

#op = ["+", "-", "*", "/", ""]
# 高速バージョン
op = ["*" , ""]
# print op
for i in 1000...10000
  c = i.to_s()
  for j in op
    for k in op
      for l in op
        val = c[3] + j + c[2] + k + c[1] + l + c[0]
        if val.size <= 4
          next
        end
        # 0除算を除外
        if val =~ /\/0/
          #puts val
          next
        end
        # 連続する0を連結
        val.sub!(/00+/, '0')
        # 0から始まる数値の0を除外
        val.gsub!(/0([1-9]+)/, '\1')
        if i == eval(val)
          puts val + " = " + i.to_s()
        end
      end
    end
  end
end


