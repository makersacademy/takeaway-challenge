require_relative './menu.rb'

class User

  attr_accessor :basket, :menu, :order, :price
  DEAFAULT_PRICE = 0

  def initialize
    @menu = Menu.new.show_menu_hash
    @basket = []
    @order = []
    @price = 0
  end

  def order_instructions
    puts "Please select your order."
    puts "To do this please enter the number of your order from 1-6. Please press enter after each selection, and double enter when you have completed your order."
    puts "If you wish to order more than one of the same dish please enter this number twice, both times pressing the space bar after."
  end
  #
  # def order_error?
  #   menu_items = ["1", "2", "3", "4", "5", "6"]
  #   order_correct = !menu_items.include?(@order)
  #   return 'The number you have input is not an item on the menu' if order_correct == false
  # end

  def order_selection
    order_instructions
    order = $stdin.gets.chomp
      while order != 0
        @order = order.to_i
      # order_error?
      accessing_price_of_order
      @basket << { @order => @price }
      puts "Thank you number #{@order} priced at £ #{@price} has been added to your bascket"
      order = $stdin.gets.chomp.to_i
    end
  end

  def calculating_total_order_price
    p "#{@order}"
  end

  def accessing_price_of_order
    keys = @menu.keys
    @price = @menu[keys[@order - 1]]
  end

end

user = User.new
user.order_instructions
user.order_selection
user.calculating_total_order_price
