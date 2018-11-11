
require_relative "delivery"

class Order

  attr_reader :order_string, :order_formatted, :actual_order_cost, :customer_order_cost, :delivery

  def initialize(delivery = Delivery)
    @order_formatted = []
    @actual_order_cost = []
    @customer_order_cost = 0
    @delivery = delivery
    order_selection
  end

  def order_number
    rand(4563..4985)
  end

  def order_selection
    puts "please make your order in the following format:"
    puts
    puts "quantity followed by item, followed by 'order total:'"
    puts "e.g., - 1 Garlic Bread, 1 Margherita, total: 12"
    @order_string = gets.chomp.to_s
    order_formatter(@order_string)
  end

# couldnt figure out how to do this in RSpec without the arg
# puts it into an ordered format for iterating through
  def order_formatter(order_string)
    order_string.split(",").each do |num|
      @order_formatted << num.split(" ",2)
    end
    order_calculation(@order_formatted)
  end

# calculates the ACTUAL cost of the order
  def order_calculation(order_formatted)
    order_formatted.each_with_index do |instance, index|
      @actual_order_cost << Menu::MENU[order_formatted[index][1]].to_i * order_formatted[index][0].to_i if Menu::MENU.has_key?order_formatted[index][1]
    end
    @actual_order_cost = @actual_order_cost.inject(:+)
    customers_cost(@order_string)
  end

# calculates the customers order
  def customers_cost(order_string)
    @order_string_split = order_string.split(": ")
    @customer_order_cost = @order_string_split[1].to_i
    order(@customer_order_cost, @actual_order_cost)
  end

# ensures both customer / machine order total is the same
# otherwise raises error
  def order(customer_order_cost, actual_order_cost)
    raise "Your total is different to the actual total, please try again" unless customer_order_cost == actual_order_cost
    confirm_order
  end

  def confirm_order
    puts "great - your order is as follows:"
    puts "#{@order_string}"
    puts
    puts "Please confirm: (y/n)"
    confirm = gets.chomp
    return @delivery.new.send_message if confirm == "y"
    puts "cancelling delivery..." if confirm == "n"
    return "cancelled delivery"
  end
end
