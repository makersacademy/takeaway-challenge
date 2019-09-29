require 'dotenv/load'
require_relative 'dish'
require_relative 'messager'
require_relative 'order'
require_relative 'printer'

class Takeaway
  def initialize(menu: nil, order_class: Order, messager_class: Messager, \
    printer_class: Printer, dish_class: Dish)
    @menu = menu || ENV['DISHES']
    @order = order_class.new(ENV['TWILIO_TO'])
    @messager = messager_class.new
    @printer = printer_class.new
    @dish_class = dish_class
    @menu_options = ["Review Order", "Add Items to Order", \
      "Check Total", "Submit Order"]
    @menu.is_a?(Array) ? nil : menu_setup
  end
    
  def run
    @printer.print_welcome
    @printer.print_menu(@menu)
    add_dishes
    manage_order
  end
  
  private 
  
  def add_dishes
    choice = get_user_input(@menu.length)
    return if choice == ""
    
    add_to_order(choice)
  end
  
  def add_to_order(selection)
    @order.add(@menu[selection - 1])
    @printer.print_confirmation
    add_dishes
  end

  def check_total
    response = @order.check_total
    @printer.print_checked_total(response)
  end

  def get_user_input(options)
    choice = gets.chomp
    return choice if choice.length.zero?
    
    choice = choice.to_i
    return choice if (1..options).cover?(choice)
    
    @printer.print_invalid_selection
    get_user_input(options)
  end
  
  def manage_order
    @printer.print_main_menu(@menu_options)
    choice = get_user_input(@menu_options.length)
    case choice
    when 1
      print_order 
    when 2
      @printer.print_menu(@menu)
      add_dishes
    when 3
      check_total
    when 4
      send_sms
    else
      @printer.print_exit
    end
    manage_order unless [4, ""].include?(choice) 
  end
  
  def menu_setup
    old_menu = @menu.delete("\n")
    old_menu = old_menu.split(",").map! { |item| item.split(":") }
    old_menu.each { |item| item[1] = item[1].to_i }
    new_menu = []
    old_menu.each do |item| 
      new_menu.append(@dish_class.new(name: item[0], cost: item[1]))
    end
    @menu = new_menu
  end

  def print_order
    order = @order.order
    total = @order.total
    @printer.print_order(order, total)
  end

  def send_sms
    expected_time = (Time.now + (60 * 60)).to_s.split(" ")[1][0..4]
    body = 
    "Thanks! Link should be able to glide your order over before " \
    + expected_time
    @messager.send_message(@order.mobile_number, body)
    @printer.print_order_submission
  end  
end
