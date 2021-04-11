require_relative 'menu'

class CustomerOrder  
  attr_reader :order, :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @order = {}
    @basket = []
  end

  def add(food, quantity)
    raise "#{food} is not available" unless @menu.on_menu?(food)
    @order = { food.to_sym => quantity }
    add_to_basket
    return "#{quantity} x #{food}(s) added to your basket"
  end

  private 

  def add_to_basket
    @basket << @order
  end
end








# './lib/customer_order.rb'