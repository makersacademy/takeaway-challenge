require_relative 'menu'
#require_relative 'make_call'


class Order

attr_reader :order, :phone_number, :order, :cust_order

    def initialize
        @menu = Menu.new
        @order = nil
        @phone_number = nil
        @cust_order = []
      #@checkout = Checkout.new
    end

    def view_menu
        puts "Todays menu is as follows..."
        @menu.todays_menu
        puts "#{@menu.print_menu}"
    end

    def place_order
          puts "... please select your pizza and press enter"
          order = STDIN.gets.chomp
          while !order.empty? do
          @cust_order << order
          puts "please choose another pizza or enter to finish your oder"
          order = gets.chomp
          end
          puts "Your order is #{cust_order}"
    end

    def confirm_order
        puts "to confirm your order please enter you telephone number"
        @phone_number = gets.chomp
        puts @phone_number
    end

end
