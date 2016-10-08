class Interface

  attr_reader :menu_array, :order

  def initialize(filepath)
    @menu = Menu.new(filepath)
    @order = Order.new
    @menu_array = []
    @order_array = []
    build_menu_display
    user_interaction
  end

  def user_interaction
    welcome
    build_order
    show_order
  end

  def build_menu_display
    @menu.dishes.each_with_index do |dish, index|
      @menu_array << "#{index + 1}. #{dish.name}  £#{'%.2f' % [dish.price]}"
    end
  end

    def welcome
    puts
    puts "Welcome to Malinna's Tasty Takeaway"
    puts
    puts "~~~~~  MENU  ~~~~~"
    display(@menu_array)
  end

  def display(array)
    array.each {|string| puts string}
  end

  def build_order
    loop do
      input_request
      input = gets.chomp
      break if input.empty?
      dish = @menu.dishes[input.to_i - 1]
      quantity_request(dish.name)
      quantity = gets.chomp.to_i
      @order.add(OrderLine.new(dish, quantity))
    end
  end

  def input_request
    puts
    puts "Please enter the number of the dish you would like,"
    puts "or press return to finish your order."
    print ">> "
  end

  def quantity_request(dish)
    puts "Please enter the quantity of #{dish} you would like"
    print ">> "
  end

  def show_order
    puts
    puts "Order summary:"
    display(@order.order_display)
    puts
    puts "Total number of dishes:  #{@order.dish_qty}"
    puts "Total cost of your order:  £#{'%.2f' % [@order.total_cost]}"
    puts
  end

end
