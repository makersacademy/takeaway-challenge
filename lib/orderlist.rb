class OrderList
  def initialize(restaurant, input = Kernel)
    @restaurant = restaurant
    @input = input
  end

  def new_order
    loop do
      puts "Respond 1 to see the menu, 2 to add to your order, or quit to cancel"
      response = @input.gets.chomp
      break if response == "quit"
      if response == "1"
        @restaurant.menu.display_all
      end
    end
  end
end
