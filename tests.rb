
# def price_check(price_sum, &block)
#   each do |price|
#     price_sum = block.call(price_sum, price)
#   end
#   price_sum
# end

list = Hash.new { |this_hash, key| this_hash[key] = 0 }
list[:Holes] = 7
list[:Clockwise_to_Titan] = 6
list[:The_Knife_of_Never_Letting_Go] = 8

p list

add_price = Proc.new { |price| price }
p add_price.call(list.values)

