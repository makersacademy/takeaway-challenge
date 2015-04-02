class Order
  def initialize
    @lines = "Thanks for your order\n"
    @grand_total = 0
  end

  def add_line line_item
    sub_total = line_item.sub_total
    dish_name_qty = line_item.dish

    dish_name_qty.reduce("") do  |out, (name, qty)|
      @lines << out << "#{qty} x #{name} = £#{sub_total}\n"
      @grand_total += sub_total
    end
  end

  def final_bill
    @lines << "Grand total = £#{@grand_total}"
  end
end
