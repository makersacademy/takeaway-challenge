require 'menu'
require 'text'

class Restaurant
attr_reader :new_menu

  def initialize
    @new_menu = Menu.new
  end

  def view
   puts @new_menu.show
  end

  def start_order
    puts "Begin order, type 'Done' when you finish."
    puts "What do you want?"
    @dish_name = gets.chomp.to_s
    until @dish_name == "Done"
      puts "How many do you want?"
      @dish_quantity = gets.chomp.to_i
      @new_menu.add_dish(@dish_name.to_sym,@dish_quantity)
      puts "What do you want?"
      @dish_name = gets.chomp.to_s
    end
  end

  def place_order(price)
    price_not_matches?(price)
  rescue StandardError
    puts "Total price not match"
  else
    puts "That's right"
    puts "#{send_text}"
  end

  private
  def price_not_matches?(input_from_place_order_above)
    raise StandardError if (@new_menu.total_price != input_from_place_order_above)
  end

  def send_text(text = Text.new)
    text.confirmation
      #send_text
      #("Thank you!
      #Your order was placed and will be delivered before 18:52"}")
  #     time = Time.new
  #       hr = time.hour + 1
  #       min = time.min
  #       "Thank you! Your order was placed and will be delivered before #{hr}:#{min}"
  end

end
