require './basket'
require './menu'
require './input_handler'
require "./text"

class UI
  attr_reader :basket,:dish_number,:dish_quantity

  def initialize(input_handler = InputHandler.new,basket = Basket.new,menu = Menu.new, text = Text.new )
    @input_handler = input_handler
    @basket = basket
    @menu = menu
    @text = text
  end

  def start_UI
    make_order
    dish_check
    dish_amount
    dish_amount_check
    add_to_basket
  end

  def make_order
    puts @menu.menu
    puts 'Enter dish number that you chose'
    @dish_number = @input_handler.get_dish_number
  end

  def dish_check
    if @dish_number == '1' || @dish_number == '2' || @dish_number == '3'
      return
    else
        puts "This number is not avalible, enter valid dish number"
        start_UI
      end
  end

  def dish_amount
    puts "You chose dish number  #{@dish_number}"
    puts "Enter how many of those dish you'd like to order"
    @dish_quantity = @input_handler.get_dish_quantity
  end

  def dish_amount_check
    if @dish_quantity == '0'
      puts "Invalid, enter a positive number"
      start_UI
    end
  end

  def add_to_basket
    puts "Added dish number #{@dish_number} to the basket."
    (@dish_quantity.to_i).times { @basket.add(@menu.menu[@dish_number.to_i]) }
    if add_more?
      start_UI
    else
      total
    if order?
      start_UI
    else order
   end
 end
end

  def total
    @basket_total = 0
    @basket.contents.each {|i| @basket_total += i[:price].to_i }
    puts "Your total is #{@basket_total}"
  end



  def add_more?
    puts 'Would you like to order any more dishes? Input yes or no'
    user_input = @input_handler.complete
    user_input == 'yes' ? true : false
 end

 def order
   puts 'You will recieve text message confirming your order'
   @text.send_message
 end

 def order?
   puts 'Say yes to order your food'
   add_more?
 end

end
