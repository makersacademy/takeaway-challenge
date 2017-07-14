require 'twilio'
require_relative 'menu'

class Takeaway

  private

  attr_reader :menu, :selection

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @selection = []
    run
  end

  def print_options
    puts ["Welcome to Takeaway!",
    "1: View the menu",
    "2: Select a dish and quantitiy",
    "3: View your order",
    "4: View the total cost of your order",
    "5: Place your order",
    "6: Exit"]
    print "Please enter the option number: "
  end

  def run
    loop do
      print_options
      case STDIN.gets.strip
      when "1"
        view_menu
        next
      when "2"
        select_dish
        next
      when "3"
        view_order
        next
      when "4"
        total
        next
      when "5"
        place_order
        next
      when "6"
        exit
        next
      end
    end
  end

  def view_menu
    puts ["--------------","Takeaway Menu","--------------"]
    puts menu.to_string
    puts ["--------------"]
  end

  def select_dish
    print "Enter the number of the dish (from 1 to #{menu.length}): "
    dish = STDIN.gets.strip.to_i
    (puts "Invalid dish"; return) unless dish.is_a?(Integer) and dish >= 1 and dish <= menu.length
    print "Enter the quantity (minimum order is 1): "
    quantity = STDIN.gets.strip.to_i
    (puts "Invalid quantity"; return) unless quantity.is_a?(Integer) and quantity >= 1
    @selection << { :dish => @menu.choose(dish), :quantity => quantity }
  end

  def view_order
    (puts 'Please select at least one dish'; return) if nothing_selected?
    puts "Your order:"
    selection.each_with_index { |item, index| puts "#{index+1}. #{item[:dish].name}, #{item[:dish].price}, quantity: #{item[:quantity]}" }
  end

  def nothing_selected?
    selection.empty?
  end

  def place_order
    (puts 'Please select at least one dish'; return) if nothing_selected?
    # print confirmation via text, including time
    @selection = []
    #"Thank you! Your order was placed and will be delivered before 18:52"
    puts "Your takeaway will be delvered in half an hour"
  end

  def total
    total = 0
    selection.each { |item| total += item[:dish].price * item[:quantity] }
    puts "Total = #{total}"
  end

end
