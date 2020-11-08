class OrderList
  def initialize(restaurant, input = Kernel, order_class = Order)
    @menu = restaurant.menu
    @order_class = order_class
    @input = input
    @confirmed_orders = []
  end

  def new_order
    pending_order = @order_class.new
    
    loop do
      show_choices

      response = @input.gets.chomp
      break if response == "quit"

      if response == "1"
        @menu.display_all
      elsif response == "2"
        add_to_order(pending_order)
      elsif response == "confirm"
        finalise_order(pending_order)
        break
      end

      display_order(pending_order)
    end
  end

  private

  def show_choices
    puts "Enter:"
    puts "1 to see the menu"
    puts "2 to add to your order"
    puts "'confirm' to place your order"
    puts "'quit' to cancel"
  end

  def add_to_order(order)
    id = @input.gets.chomp.to_i
    selection = @menu.select(id)
    quantity = @input.gets.chomp.to_i
    order.add(selection, quantity)
  end

  def finalise_order(order)
    raise "Your order is empty!" if order.empty?

    @confirmed_orders.push(order)
    puts "Order received! You'll get a text shortly confirming your delivery time."
  end

  def display_order(order)
    puts "Current order:"
    puts order
  end
end
