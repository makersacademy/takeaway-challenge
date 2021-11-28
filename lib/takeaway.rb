require_relative('./menu.rb')
require_relative('./order.rb')

class Takeaway
  attr_reader :menu, :order

    def initialize(menu:)
      @order = Order.new
      @menu = menu
    end 

    def print_menu
      @menu.print
    end

    def add_to_order(dish, quantity)
      @order.my_dishes << {dish => quantity}
      puts "#{quantity} #{dish} added to your order!"
    end 

end 

