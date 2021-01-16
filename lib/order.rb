require './lib/menu'

class Order


  def initialize
    @order = []

  end


  def add_to_order(dish, amount)
    @order << Menu::DISHES.select { |k,v| k == dish }
    @order <<  amount
  end

  def show_order
    @order
  end


private

  def amount(num)
    @order << num
  end
end
