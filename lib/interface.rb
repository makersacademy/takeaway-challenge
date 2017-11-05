require '/Users/marcovanali/Desktop/Projects/Weekend_Challenges/takeaway-challenge/lib/restaurant.rb'

class Interface

  def initialize
    @restaurant = Restaurant.new
    @logo = Takeaway_logo.new
  end

  def user_choice
    @logo.menu_header
    options
    choice = gets.chomp
    case choice
    when '1' then
      @restaurant.show_menu
      ask_action
      user_choice
    when '2'
       @restaurant.select_dishes
       @restaurant.payment_message
       go_back
       user_choice
     when '3' then
       @restaurant.payment_message
       @restaurant.user_payment
       @restaurant.conferm_sms
       exit
     when '4' then exit
     end
  end

  private

  def go_back
    type = 0
    while type != ""
      puts "\nPress just Enter to go back to the Home page"
      type = gets.chomp
      user_choice if type == ""
    end
  end

  def options
    puts "1. See Menu and make an Order"
    puts "2. See your basket"
    puts "3. Payment"
    puts "4. Exit"
  end

  def ask_action
    type = 0
      puts "\nDo you want to make an order?(Y/N)"
      puts "Please write Y and press Enter to order."
      type = gets.chomp
      if type == "Y"
        @restaurant.food_and_quantity
      else
        user_choice
      end
  end
end

interface = Interface.new
interface.user_choice
