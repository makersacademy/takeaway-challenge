require_relative 'menu'
require_relative 'basket'

class Takeaway

  attr_reader :basket, :menu

  def display_menu
    @menu = Menu.new
    @menu.display
  end

  def display_basket
    @basket = Basket.new
    @basket
  end

  # def order(item)
  #   if @menu.has_key?(item)
  #     @basket << item
  #   end
  # end

  # def display_basket
  #   total_cost = 0
  #   basket_string = "Your order:"
  #   @menu.each do |dish, price|
  #     if @basket.include? dish
  #       basket_string += "\n#{dish}: £#{price.to_s}"
  #       total_cost += price
  #     end
  #   end
  #    basket_string += "\nTotal: £" + total_cost.to_s
  # end

  def dish_price_list

  end

end
