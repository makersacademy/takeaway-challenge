require_relative 'menu'

class CustomerOrder  
  attr_reader :order, :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
  end

  def add(food, quantity)
    raise "#{food} is not available" unless @menu.on_menu?(food)

    @order[food.to_sym] = quantity
    return "#{quantity} x #{food}(s) added to your basket"
  end

  def total_price
    "£#{add_to_basket.inject(:+)}"
  end

  private 

  def add_to_basket
    @order.map do |food, quantity|
      @menu.cost(food) * quantity
    end
  end
end
