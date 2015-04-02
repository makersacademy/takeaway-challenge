class Order
  attr_reader :grand_total

  def initialize
    @lines = "Thanks for your order\n"
    @grand_total = 0
  end

  def add_line line_item
    sub_total = line_item.sub_total
    dish_name = line_item.dish
    dish_qty = line_item.quantity
    @grand_total += line_item.sub_total
    @lines << "#{dish_qty} x #{dish_name} = £#{sub_total}\n"
  end

  def final_bill
    @lines + "Total = £#{@grand_total}"
  end
end
