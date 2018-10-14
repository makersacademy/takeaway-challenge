require_relative 'menu'
require_relative 'takeaway'

class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def basket
    @basket
  end


  def display
    total_cost = 0
    basket_string = "Your order:"
    @menu.each do |dish, price|
      if @basket.include? dish
        basket_string += "\n#{dish}: £#{price.to_s}"
        total_cost += price
      end
    end
    basket_string += "\nTotal: £" + total_cost.to_s
  end
end
