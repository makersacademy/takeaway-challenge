class TakeAway
attr_reader :order, :order_total
  MENU = {
    "Chicken" => 9.99,
    "Pizza" => 7.50,
    "Pasta" => 8.00,
    "Salad" => 7.00
  }

  def initialize 
    @order = []
    @order_total = []
  end

  def menu
    MENU
  end

  def select(dish, quantity = 1)
    item = MENU.select { |key| key == dish }
    order << item.transform_values { |v| quantity * v.to_f } 
  end

  def basket_summary
    print order
  end

  def total_amount
    total = order.flat_map { |i| i.values }
    order_total << total.inject(0){|sum,x| sum + x }
    format_total
  end

  def format_total
    print "Your order total is #{order_total.join(" ")}"
  end
end
