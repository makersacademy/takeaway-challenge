require_relative 'order'
require_relative 'dish_filter'

class Takeaway

  attr_accessor :current_order

  def initialize(menu, api_client, order_class = Order)
    @menu = menu
    @api_client = api_client
    @order_class = order_class
  end

  def show_menu
    puts @menu.pretty_dishes
  end

  def add_order
    @current_order = @order_class.new if @current_order == nil

    got_dish = select_dish

    if got_dish == nil
      puts "Invalid Dish"
      return
    end

    quantity = select_quantity
    @current_order.add_dish(got_dish, quantity)
  end

  def show_order
    if @current_order != nil
      total = @current_order.order_total
      puts "Cost: £%<total>.2f" % { total: total }
    else
      puts "Order is empty"
    end
  end

  def make_order
    if @current_order == nil
      puts "No order to make"
      return
    end

    @current_order = nil

    create_message
  end

  def prompt
    puts "Select an option:\n1.\tMenu\n2.\tOrder\n3.\tShow Order\n4.\tMake Order\n9.\tExit"

    user_input = gets.chomp

    case user_input
    when "1"
      show_menu
    when "2"
      add_order
    when "3"
      show_order
    when "4"
      make_order
    when "9"
      exit 0
    else
      puts "Please select a valid option"
    end
  end

  private

  def select_dish
    puts "Please input a dish id"
    user_input = gets.chomp
    @menu.get_dish(user_input.to_i)
  end

  def select_quantity
    puts "How many would you like?"
    user_input = gets.chomp
    user_input.to_i
  end

  def create_message
    expected_time = Time.now + 3600
    formatted_time = expected_time.strftime("%H:%M")

    @api_client.messages.create(
      body: "Thank you! Your order was placed and will be delivered before #{formatted_time}",
      to: ENV["PHONE_NUMBER"],
      from: "+44 7588 065563"
    )
  end

end
