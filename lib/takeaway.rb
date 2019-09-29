require_relative 'dish_list_printer'
require_relative 'order'
require_relative 'dish'
require_relative 'messager'

class Takeaway
  include DishListPrinter

  def initialize(dishes, order_class=Order, messager_class=Messager)
    @dishes = dishes
    @order_class = order_class
    @order = @order_class.new(ENV['TWILIO_TO'])
    @messager_class = messager_class
    @messager = messager_class.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
  end

  def run
    puts "Welcome to Link's Wild Delivery!"
    print_menu
    add_dishes
    manage_order
  end
  
  private 
  
  def add_dishes
    choice = get_user_input(@dishes.length)
    return if choice == ""
    
    add_to_order(choice)
    add_dishes
  end
  
  def add_to_order(selection)
    @order.add(@dishes[selection - 1])
    print_confirmation
  end

  def check_total
    @order.check_total
  end

  def get_user_input(options)
    choice = gets.chomp
    return choice if choice.length == 0
    
    choice = choice.to_i
    return choice if (1..options).include?(choice)
    
    invalid_selection
    get_user_input(options)
  end
  
  def invalid_selection
    puts 'Invalid selection, try again or Enter to finish.'
  end
  
  def manage_order
    print_main_menu
    choice = get_user_input(@main_menu.length)
    case choice
    when 1
      print_order 
      manage_order   
    when 2
      print_menu
      add_dishes
      manage_order
    when 3
      check_total
      manage_order
    when 4
      send_sms
      puts "Thanks, your order has been submitted!"
      puts "You should receive an SMS with delivery information shortly"
    else
      puts "Sorry to see you go! Come back soon!"
      exit
    end
  end

  def print_main_menu
    @main_menu = [
      "1.  Review Order",
      "2.  Add Items to Order",
      "3.  Check Total",
      "4.  Submit Order",
      "Please make a selection:"
    ]
    @main_menu.each { |item| puts item }
  end
  
  def print_menu
    puts "Here's the menu, please enter which items you'd like:"
    print_list(@dishes)
  end
  
  def print_order
    @order.print_order
  end
  
  def print_confirmation
    puts "Added to order."
    puts "Anything else? Enter to finish adding items."
  end

  def send_sms
    expected_time = ((Time.now + (60 * 60)).to_s.split(" "))[1][0..4]
    body = "Thanks! Link should be able to glide your order over before " + expected_time
    @messager.send_message(@order.mobile_number, body)
  end  
end
