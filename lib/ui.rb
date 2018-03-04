require './lib/order.rb'
require './lib/menu.rb'

class UI
  def initialize(order = Order.new)
    @menu = order.menu
    @order = order
  end

  def print_options
    options = ['1. Print menu', '2. Add items to basket', '3. See order',
         '4. Checkout', '5. Exit']
    p options
  end

  def print_order
    print "Order so far: "
    puts @order.items.to_s
    p "Order subtotal: " + @order.total.to_s
  end

  def process(selection)
    case selection
      when "1"
        @menu.print
      when "2"
        @order.add
        print_order
      when "3"
        print_order
      when "4"
        print_order
        puts "Would you like to make the order? (Y or N)"
        input = user_input
        require './lib/send_sms.rb' if input == "Y"
        exit
      when "5"
        exit
      else
        "I don't know what you mean, please try again"
    end
  end

  def interactive_menu
    loop do
      print_options
      choice = user_input
      process(choice)
    end
  end

  private

  def user_input
    gets.chomp
  end

end
