require_relative 'menu'
require_relative 'message'

# stores the order by a customer
class Order
  attr_reader :order_list

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_item = nil
    @order_list = []
    @message = Message.new
  end

  def select_food(dish, quantity = 1)
    @menu.selected_item(dish)
    store_item(quantity)
  end

  def show_total
    @order_list.each { |order| puts display_order(order) }
    puts "--------------"
    puts "Total price: £#{calculate_total}"
  end

  def end_order
    show_total
    confirm_order
    @message.send_message(@price) if @response == "y"
  end

  private
  def store_item(quantity)
    @order_list << { dish: @menu.dish, quantity: quantity, price: @menu.price * quantity }
  end

  def display_order(order)
    "#{order[:quantity]}x #{order[:dish]}: £#{order[:price]}"
  end

  def calculate_total
    total = 0
    @order_list.each { |order| total += order[:price] }
    total
  end

  def confirm_order
    loop do
      puts "Is this your final order? (y/n)"
      @response = gets.chomp
      break if @response == "y" || @response == "n"
      puts "Sorry, I don't follow."
    end
  end
end
