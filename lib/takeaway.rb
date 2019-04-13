class Takeaway

attr_reader :order, :pizzas

  def initialize
    @pizzas = [
      { name: :Original, price: 8 },
      { name: :Pepperoni, price: 10 },
      { name: :Veggie, price: 9 },
      { name: :Hawaiian, price: 10 },
      { name: :Ranch, price: 12 },
      { name: :Garlic, price: 8 }
    ]
  end

  def create_order(order = Order.new)
    @order = order
  end

  def confirm_order
    @order.confirm_order
    exit
  end

end
