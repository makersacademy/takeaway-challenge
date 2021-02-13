require './basket'
require './menu'
require './input_handler'

class UI
  attr_reader :basket

  def initialize(input_handler)
    @input_handler = input_handler
    @basket = Basket.new
    @menu = Menu.new
  end

  def start_UI
    make_order
  end

  def make_order
    puts @menu.menu
    puts 'Enter dish number that you chose'
    @dish_number = @input_handler.get_dish_number
    dish_check
  end

  def dish_check
    if @dish_number == '1' || @dish_number == '2' || @dish_number == '3'
      dish_amount
    else
      puts "This number is not avalible, enter valid dish number"
      make_order
    end
  end

  def dish_amount
    puts "You chose dish number  #{@dish_number}"
    puts "Enter how many of those dish you'd like to order"
    @dish_quantity = @input_handler.get_dish_quantity
    dish_amount_check
  end

  def dish_amount_check
    if @dish_quantity == '0'
      puts "Invalid, enter a positive number"
      dish_amount
    else
      add_to_basket
    end
  end

  def add_to_basket
    puts "Added dish number #{@dish_number} to the basket."
    (@dish_quantity.to_i).times { @basket.add(@menu.menu[@dish_number.to_i]) }
    if add_more?
      make_order
    else
      total
    end
  end
  def total
    basket_total = @basket.contents[:price].flatten.sum
    puts "Your total is #{basket_total}"
  end

  end

  def add_more?
    puts 'Would you like to order any more dishes? Input yes or no'
    user_input = @input_handler.complete
    user_input == 'yes' ? true : false
end
