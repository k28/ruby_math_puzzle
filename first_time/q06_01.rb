#! ruby -Ku

def check_value(original)

  val = original * 3 + 1

  while true
    if val % 2 == 0
      val = val / 2
    else
      val = (val * 3) + 1
    end

    return false if val == 1
    return true if val == original
  end
end

# かっこいいパターン
puts 2.step(10000, 2).count{ |i|
  check_value(i)
}

# forを使ってループするパターン
# count = 0
# for i in 1..10000
#   next if i % 2 != 0
# 
#   if check_value(i)
#       count += 1
#   end
# end
# 
# puts count

