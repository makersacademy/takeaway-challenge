# I would like to be able to select some number of several available dishes
# I would like to check that the total I have been given matches the sum of the various dishes in my order

require_relative 'menu.rb'

class Order

attr_reader :user_order, :place_order, :quantity

  def initialize
    @user_order = []
    @basket = Hash.new([0.0])
    @menu = Menu.new
  end

  # def basket
  #   @basket.dup
  # end
  #this works but query best for price?

  def price(item)
  fail 'Item not in menu!' unless !!@menu_contents.include?(item)
  @menu_contents[item]
  end

  def place_order(item, quantity = 1)
    # fail "please order from menu" if !@menu.public_menu_contents.keys.include?(item)
    quantity += @basket[item].first
    @basket[item] = quantity, quantity * price(item)
  end
    # user_order << {item: item, quantity: quantity}

  def bill
   @basket.inject(0) { |sum, (_item, (_quantity, subtotal))| sum + subtotal }
  end


end

# THE SUPER LONG ORDER
    # def take_order
    #   while user_input != "I'm done ordering"
    #     puts "What would you like to eat? :"
    #     user_input = gets.chomp
    #     break if user_input == "I'm done ordering"
    #     fail "Please select from menu" if !@menu.menu_contents.has_key?(user_input)
    #     puts "How many #{user_input}?"
    #     quantity = gets.chomp.to_i
    #     puts "Anything else or type 'I'm done ordering to finish :'"
    #     @your_order[user_input] = quantity
    #     end
    # end

    # def order_cost
    #
    #   total = user_order.inject(0){|result_memo, item| result_memo + user_order.order_quantity}
    #
    #   # list = user_order.inject {}
    #   # list = user_order.fetch { |quantity| * {public_menu_contents[value]}}
    #   # balance += list
    # end
