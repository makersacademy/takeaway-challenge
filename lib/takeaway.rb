require_relative 'confirmation'

class Takeaway
attr_reader :menu, :selected_dishes

  def initialize
    @menu = {"VEGAN BURGER"=> 10.95, "VEGAN CHILLI" => 11.95, "CHIPS" => 4.50}
    @selected_dishes = []
    @total = 0
  end

  def show_menu
    puts @menu
  end

  def select_food
    puts "what would you like to order?"
    dish = gets.chomp.upcase!
    retrieve_from_menu(dish)
    prompt
  end

  def prompt
    loop do
    puts "Anything else? Type stop to finish"
    dish = gets.chomp.upcase!
    retrieve_from_menu(dish)
    break if dish == "STOP"
    end
  end

  def retrieve_from_menu(dish)
        if value = @menu[dish]
         puts "Nice! #{dish}, £#{value} has been added to your order"
         @selected_dishes << dish
         @total += @menu[dish]
       elsif dish == "STOP"
         puts "Let's get to the checkout"
         print_order
        else
          puts "We don't have that on the menu, sorry!"
       end
  end

  def print_order
    printed_order
    display_total
  end

  private

  def printed_order
    puts "You have ordered:"
    @selected_dishes.each do |dish|
    puts dish
    end
  end

  def display_total
    puts "And the total is £#{@total}"
    check_out
  end

  def check_out
    text = Sms.new
    puts "A confirmation text is on it's way to you now"
    text.send_text
 end
end
