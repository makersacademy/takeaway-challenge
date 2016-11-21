class Order

  attr_reader :dishes
  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    fail NoItemError, "#{dish.capitalize} is not on the menu!" unless menu.has_dish?(dish)
    dishes[dish] = quantity
  end

  def total
    item_totals.inject(:+)
  end

  private

  attr_reader :menu

  def item_totals
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end



  end

  class NoItemError < StandardError; end



# require './lib/menu'
# require './lib/messager'
# #require 'dotenv'
# #Dotenv.load
#
# class Order
#
#   attr_reader :basket, :total, :messager
#
#   def initialize(menu_klass)
#     @menu_klass = menu_klass
#     @basket = []
#     @total = 0
#     @messager = Messager.new
#   end
#
#   def make_order(hash)
#     hash.each do |order,amount|
#       amount.times do
#         (@menu_klass.menu.each do |food,price|
#           if food == order
#             self.basket << {food => price}
#           end
#         end)
#       end
#     end
#
#     basket_summary
#   end
#
#   def complete_order
#     self.basket.each do |instance|
#       instance.each do |food,price|
#         @total += price
#       end
#     end
#   end
#
#   def checkout(price)
#     fail "That is not the right total" if price != @total
#     complete_order
#     @messager.message
#   end
#
#   private
#
#   def basket_summary
#     self.basket
#   end
#
# end
