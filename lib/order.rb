require_relative 'menu'

class Order

  attr_reader :order, :menu, :total

  def initialize
    @order = []
    @total = 0
    @menu = Menu.new
  end

  def add_to_basket(food, quantity = 1)
    quantity.times { @order << food }
  end

  def checkout
    @order.map do |food|
      @total += @menu.dish[food] 
    end
    @total
  end

end
