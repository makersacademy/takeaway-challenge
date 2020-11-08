class OrderList
  def initialize(restaurant, input = Kernel, order_class = Order)
    @menu = restaurant.menu
    @order_class = order_class
    @input = input
  end

  def new_order
    order = @order_class.new
    loop do
      puts "Respond 1 to see the menu, 2 to add to your order, or quit to cancel"
      response = @input.gets.chomp
      break if response == "quit"
      if response == "1"
        @menu.display_all
      elsif response == "2"
        id = @input.gets.chomp.to_i
        selection = @menu.select(id)
        quantity = @input.gets.chomp.to_i
        order.add(selection, quantity)
      end
    end
  end
end
