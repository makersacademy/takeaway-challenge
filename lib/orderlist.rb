class OrderList
  def initialize(restaurant, input = Kernel, order_class = Order)
    @menu = restaurant.menu
    @order_class = order_class
    @input = input
    @confirmed_orders = []
  end

  def new_order
    order = @order_class.new
    loop do
      puts "Respond 1 to see the menu, 2 to add to your order, confirm to place order, or quit to cancel"
      response = @input.gets.chomp
      break if response == "quit"

      if response == "1"
        @menu.display_all
      elsif response == "2"
        id = @input.gets.chomp.to_i
        selection = @menu.select(id)
        quantity = @input.gets.chomp.to_i
        order.add(selection, quantity)
      elsif response == "confirm"
        @confirmed_orders.push(order)
        puts "Order received! You'll get a text shortly confirming your delivery time."
        break
      end

      puts "Current order:"
      puts order
    end
  end
end
