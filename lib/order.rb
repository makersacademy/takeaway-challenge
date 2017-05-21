require_relative 'menu.rb'
require_relative 'inputoutput.rb'

class Order

  attr_reader :order_hash, :menu

  def initialize(menu = Menu.new, inputoutput = InputOutput.new)
    @order_hash = {}
    @menu = menu
    @inputoutput = inputoutput
  end

  def create_order
    print @menu.create_menu_string
    ordering_a_dish
    check_order_amount
    @inputoutput.send_text
    print("Order is on its way!")
  end

  def ordering_a_dish
    print("Which dish would you like?\n")
     print dish = gets.chomp
    raise  'This is not a dish in the menu' unless check_dish_against_menu(dish)
     print add_dish_to_order(dish)
     print number_of_portions(dish)
  end

  def check_dish_against_menu(dish)
    @menu.list.include? dish.to_sym
  end

  def multiple_dishes
    print "Answer yes if you want to choose another dish\n"
    response = gets.chomp
    response == 'yes'
  end

  def number_of_portions(dish)
    print("How many portions would you like\n")
    number = gets.chomp.to_i
    change_quantity_of_dish(dish, number) if number > 1
  end

  def add_dish_to_order(dish)
    @order_hash[dish.downcase.to_sym] = 1
  end

  def change_quantity_of_dish(dish, number)
    @order_hash[dish.downcase.to_sym] = number
  end

  def check_order_amount
    print("Let us know the total amount and then your order will be on its way!\n")
    amount = gets.chomp.to_i
    raise "Please check the amount given" unless amount == total_of_order
    true
  end

  def total_of_order
    sum = 0
    @order_hash.each {|k,v| sum += @menu.list[k] * v}
    sum
  end

end
