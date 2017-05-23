require_relative 'menu'
require_relative 'message'

# stores the order by a customer
class Order
  attr_reader :order_list

  def initialize(menu = Menu.new) #printer = Printer.new
    @menu = menu
    @selected_item = nil
    @order_list = []
    @message = Message.new
    puts "Welcome to Veg-E! What will your order be?"
    puts ""
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
    @response == "y" ? complete_send : puts("No worries!")
  end

  private
  def store_item(quantity)
    @order_list << { dish: @menu.dish, quantity: quantity, price: @menu.price * quantity }
  end

  def display_order(order)
    "#{order[:quantity]}x #{order[:dish]}: £#{order[:price]}"
  end

  def calculate_total
    @total = 0
    @order_list.each { |order| @total += order[:price] }
    @total
  end

  def confirm_order
    loop do
      puts "Is this your final order? (y/n)"
      @response = gets.chomp
      break if @response == "y" || @response == "n"
      puts "Sorry, I don't follow."
    end
  end

  def complete_send
    puts "Your food is on its way; eet smakelijk!"
    @message.send_message(@total)
  end
end
