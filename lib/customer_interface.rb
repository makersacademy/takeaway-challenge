class CustomerInterface

  attr_reader :menu, :order

  def initialize
    @menu = [{ dish: "Katsu Chicken Curry", price: 7.99 }, { dish: "Sushi Platter", price: 21.99 }]
    @order = Order.new
  end

  def print_menu
    puts "----------------------- MENU -------------------------"
    @menu.each do |menu_line|
      puts "#{menu_line[:dish]} ----------- £#{menu_line[:price]}"
    end
    puts "---------------------END OF MENU----------------------"
  end

  def select_dish(dish)
    @order.add_dish(dish)
  end

  def remove_dish(dish)
    @order.remove_dish(dish)
  end

  def check_order
    print_order
  end

  def checkout
    puts "Thank you, your order has been placed"
  end

  private

  def print_order
    @order.dishes.each do |dish|
      puts "#{dish} ----------- £#{@order.prices[@order.dishes.index(dish)]}"
    end
  
    puts "Order total: £#{@order.total_cost.round(2)}"
    puts "Estimated time to make your order: #{@order.total_prep_time} minutes"
  end

end
