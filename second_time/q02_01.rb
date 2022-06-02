#
# Q 02
#

operand = ["", "+", "-", "*", "/"]

(1000..9999).each do |num|
  num_str = num.to_s
  a = num_str[0]
  b = num_str[1]
  c = num_str[2]
  d = num_str[3]

  operand.each do |a1|
    operand.each do |b1|
      operand.each do |c1|
        if a1.empty? && b1.empty? && c1.empty?
          next
        end

        calc_str = a + a1 + b + b1 + c + c1 + d
        # 連続する0を連結
        calc_str.sub!(/00+/, '0')
        # 0から始まる数値の0を除外
        calc_str.gsub!(/0([1-9]+)/, '\1')
        # 0除算を除外
        if calc_str =~ /\/0/
          next
        end

        if num.to_s.reverse == eval(calc_str).to_s then
          p "#{num} : #{calc_str}"
        end
      end
    end
  end
end

