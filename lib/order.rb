require_relative 'menu.rb'
require_relative 'inputoutput.rb'

class Order

  attr_reader :order_hash, :menu

  def initialize(menu = Menu.new, inputoutput = InputOutput.new)
    @order_hash = {}
    @menu = menu
    @inputoutput = inputoutput
  end



  # def start_order
  #   print_menu
  #   @inputoutput.print_to_terminal("Which dish would you like?\n")
  #   dish = @inputoutput.get_input
  #   add_dish_to_order(dish)
  #   @inputoutput.print_to_terminal("How many portions would you like\n")
  #   number = @inputoutput.get_input
  #   change_quantity_of_dish(dish, number)
  #   @inputoutput.print_to_terminal("Let us know the total amount and then your order will be on its way!\n")
  #   amount = @inputoutput.get_input
  #   check_order_amount(amount)
  #   @inputoutput.print_to_terminal("Order is on its way!")
  # end


  def print_menu
    @inputoutput.print_to_terminal(menu.create_menu_string)
  end

  def add_dish_to_order(dish)
    @order_hash[dish.downcase.to_sym] = 1
  end

  def change_quantity_of_dish(dish, number)
    @order_hash[dish.downcase.to_sym] = number
  end

  def check_order_amount(amount)
    amount.to_i
    raise "Please check the amount given" unless total_of_order == amount
    true
  end

  def total_of_order
    sum = 0
    @order_hash.each {|k,v| sum += @menu.list[k] * v}
    sum
  end

end
