class Order
  attr_reader :my_order, :my_bill, :orde_details
  def initialize
    @my_order = []
    @my_bill = []
    @orde_details = {}
  end

  def add_items(dish, quantity)
    @my_order.push("#{dish} * #{quantity}")
    @my_bill.push(Menu::The_menu[dish] * quantity)
  end

  def total_amount
    @my_bill.inject(0, :+)
  end
end
