# require_relative 'menu1'
#
# class ShoppingBasket
#
#   attr_accessor :basket, :add_item, :total, :totalizer, :pizza_count, :salad_count, :pasta_count, :curry_count, :chili_count
#
#   # PIZZA_COUNT = @basket.count({:pizza=>10})
#
#   def initialize
#     @basket = []
#     @pizza_count = 0
#     @salad_count = 0
#     @pasta_count = 0
#     @curry_count = 0
#     @chili_count = 0
#
#     # @total = 0
#   end
#
#   def add_item(selection)
#     @basket << selection
#     return self
#   end
#
#
#   def print_basket
#     puts "#{@pizza_count} x Pizza, Cost: £#{@pizza_count * 10}" if @basket.count({:pizza=>10}) > 0
#     puts "#{@salad_count} x Salad, Cost: £#{@pasta_count * 8}" if @basket.count({:pasta=>8}) > 0
#     puts "#{@curry_count} x Curry, Cost: £#{@curry_count * 11}" if @basket.count({:curry=>11}) > 0
#     puts "#{@chili_count} x Salad, Cost: £#{@chili_count * 12}" if @basket.count({:chili=>12}) > 0
#     puts "Total cost: £#{totalizer}"
#   end
#
#   def totalizer
#     total = 0
#     @basket.each do |hash|
#       hash.each do |k,v|
#         total += v
#       end
#     end
#     return total
#   end
#
# end
