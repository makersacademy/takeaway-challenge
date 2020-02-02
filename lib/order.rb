class Order
  attr_reader :my_order, :my_bill, :orde_details, :self_calculated_total, :total_amount
  def initialize
    @my_order = []
    @my_bill = []
    @self_calculated_total = 0
  end

  def add_items(dish, quantity, total)
    @my_order.push("#{dish} * #{quantity}")
    @my_bill.push(Menu::The_menu[dish] * quantity)
    @self_calculated_total += total
  end

  def total_amount
    @total_amount = @my_bill.inject(0, :+)
  end

  def place_order
    fail "Your payment amount is incorrect" unless @self_calculated_total == @total_amount
  end
end
