class Order
  attr_accessor :menu, :order, :total
  def initialize
    @order = []
    @total = 0
    @menu = Menu::MENU
  end

  def add(dish, amount = 1)
    amount.times { @order << dish }
    amount.times { @total += @menu[dish] }
  end
end
