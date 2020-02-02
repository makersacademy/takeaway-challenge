class Order
  attr_reader :my_order, :my_bill
  def initialize
    @my_order = []
    @my_bill = []
  end

  def select_item(dish, quantity)
    @my_order.push("#{dish} * #{quantity}")
    @my_bill.push(Menu::The_menu[dish] * quantity)
  end
end
