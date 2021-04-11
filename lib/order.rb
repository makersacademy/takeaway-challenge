require 'menu'

class Order 
  attr_reader :basket, :total_order_amount, :menu

  def initialize(menu = Menu.new)
    @basket = []
    @total_order_amount = 0
    @menu = menu
  end


  def select_dish(dish, quantity = 1)
    fail "#{dish} is not available to order" unless dish_available?(dish)

    @menu.menu_list.map { |item| quantity.times { @basket << item } if item[:dish] == dish }
  end

  def calculate_order_value
    @basket.map { |item| @total_order_amount += item[:price].to_i }
  end


  private
  def dish_available?(dish)
    @menu.menu_list.each { |item| return item[:available?] if item[:dish] == dish }
  end
end
