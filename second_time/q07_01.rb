
require 'date'

start_date = Date.new(1964, 10, 10)
end_date   = Date.new(2020, 7,  24)

(start_date..end_date).each do |d|
  date_str = d.strftime("%Y%m%d")

  date_int = date_str.to_i
  if date_int == date_int.to_s(2).reverse.to_i(2)
    p date_str
  end
end

