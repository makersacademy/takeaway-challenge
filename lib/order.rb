# I would like to be able to select some number of several available dishes
# I would like to check that the total I have been given matches the sum of the various dishes in my order

require_relative 'menu.rb'

class Order

attr_reader :basket, :balance

  def initialize(menu= Menu.new)
    # (menu_klass = Menu)
    # @menu_klass = menu_klass
    @basket = {}
    @balance = 0
  end

  def place_order(item, quantity = 1)
    fail "please order from menu" if !@menu.public_menu_contents.keys.include?(item)
    basket << [item, quantity]
  end

  def price(item, amount)
    total = 0
    cost += (@public_menu_contents[item]*amount)
  end

#Here I want to check that the basket matches price.
  def create_receipt
  total_cost = 0
  @basket.each {|item, quantity|
    total_cost += price(item,quantity)
  }
  total_cost
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
