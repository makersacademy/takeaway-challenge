require_relative 'menu'
require_relative 'basket'

class Takeaway

  attr_reader :basket, :menu
  def initialize
    @menu = Menu.new
    @basket = Basket.new
  end

  def order(item)
    @basket.list << item if @menu.list.has_key?(item)
  end

  def display_menu
    @menu.list
  end

  def basket_arr
    @basket.list
  end

  def display_basket
    total_cost = 0
    basket_string = "Your order:"
    @menu.list.each do |dish, price|
      if @basket.list.include? dish
        basket_string += "\n#{dish}: £#{price}"
        total_cost += price
      end
    end
    basket_string += "\nTotal: £" + total_cost.to_s
    basket_string
  end

end
