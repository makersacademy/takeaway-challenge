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

  def menu
    index = 1
    @pizzas.each do |pizza|
      puts "#{index}: #{pizza[:name]} (£#{pizza[:price]})"
      index += 1
    end
  end

  def create_order(order = Order.new)
    @order = order
  end

  def display_order(order = @order)
    order.display_pizzas
    puts "Order Total = £#{@order.total_price}"
  end

  def add_order(pizza_no)
    pizza = @pizzas[pizza_no - 1]
    @order.add_selected_pizza(pizza)
  end

  def place_order(order = @order)
    order.confirm_order
    puts "Order successfully placed!"
  end

end
