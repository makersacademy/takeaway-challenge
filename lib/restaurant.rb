require './lib/menu'
require './lib/text'
#WHY CAN'T YOU PUT
#require 'text'
#require 'menu'

class Restaurant

  def initialize(new_menu = Menu.new)
    @new_menu = new_menu
  end

  def view
   puts @new_menu.show
  end

  def start_order
    puts "Begin order, type 'Done' when you finish."
    dishname = get_dish_name
    until dishname.to_s == "Done"
      dishquantity = get_dish_quantity
      @new_menu.add_dish(dishname,dishquantity)
      dishname = get_dish_name
    end
  end

  def place_order(price)
    price_not_matches?(price)
  # rescue StandardError
  rescue => e
    puts "#{e.message}"
    # puts "Total price not match"
  else
    puts "That's right"
    puts "#{send_text}"
  end

  private
  def price_not_matches?(input_from_place_order_above)
    # raise StandardError if (@new_menu.total_price != input_from_place_order_above)
    raise "Total price not match" if (@new_menu.total_price != input_from_place_order_above)
  end

  def get_dish_name
    puts "What do you want?"
    dish_name = gets.chomp
    dish_name
  end

  def get_dish_quantity
    puts "How many do you want?"
    dish_quantity = gets.chomp
    dish_quantity
  end

  def send_text(text = Text.new)
    text.confirmation
  end

end
