require_relative 'menu'

class Order

  attr_reader :order_record, :bill, :menu

  def initialize(bill = 0)
    @order_record  = []
    @bill = bill
    @menu = Menu::DISHES
  end

  def add(dish, quantity = 1)
    raise "Dish not on menu" if !on_menu?(dish)

    quantity.times { @order_record << dish}
    quantity.times { @bill += @menu[dish] }

  end

  private

  def on_menu?(dish)
    @menu.key?(dish)
  end

end
