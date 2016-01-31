# I would like to be able to select some number of several available dishes

require_relative 'menu.rb'

class Order

attr_reader :user_order, :place_order

  def initialize
    @user_order = []
    @menu = Menu.new
  end

  def place_order(item, quantity)
    fail "please order from menu" if !@menu.public_menu_contents.keys.include?(item)
    user_order << {item: item, quantity: quantity}
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
