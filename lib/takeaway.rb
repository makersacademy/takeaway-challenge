require 'twilio-ruby'
require 'colorize'
require_relative 'messaging'

class Takeaway

  include Messaging

  attr_accessor :menu, :order_information, :takeaway

  def initialize(type=:makeaway)
    @takeaway = type.downcase
    @menu = menu_types[takeaway]
    @order_information = {}
  end

  def menu_types
    menu_types = { makeaway: {  'Peanut Butter Sandwich' => 1.12,
                                'Bowl of Cornflakes'     => 0.99,
                                'Banana'                 => 0.10,
                                'Apple'                  => 0.15,
                                'Croissant'              => 0.67,
                                'Tea'                    => 0.70,
                                'Coffee'                 => 0.80 },

                   nandos:   {  'Half Chicken'           => 9.99,
                                'Quarter Chicken'        => 7.99,
                                'Whole Chicken'          => 13.99,
                                'Sweet Potato Mash'      => 2.99,
                                'Garlic Bread'           => 2.99,
                                'Olives'                 => 1.49 },

                   luigis:   {  'Pepperoni Pizza'        => 9.99,
                                'Spaghetti Bolognease'   => 8.99,
                                'Lasagne'                => 7.99,
                                'Salad'                  => 2.99,
                                'Gnocchi'                => 9.99 }
                  } 
  end

  def show_menu
    spacing = 32
    menu.each do |menu_item, price|
      print "#{menu_item} ".red; 
      print "." * (spacing - menu_item.length)
      print " £#{price}\n"
      sleep(1)
    end
  end

  def check_answer
    return true if gets.chomp == 'y'
  end

  def check_dish
    input = gets.chomp.capitalize
    return input if menu.has_key?(input)
    while dish == nil
      puts "Sorry we dont have that. What else would you like?"
      dish = check_dish
    end
  end

  def take_call_from(customer)
    puts "Hello #{takeaway.capitalize}, would you like to place an order?"; sleep(1)
    puts 'Type y for yes and n for no, then hit enter...'
    check_answer == true ? take_order : end_call
  end

  def get_dish
    puts 'What would you like to order?'
    dish = check_dish
    puts 'How many would you like?'
    quantity = gets.chomp.to_i
    order_information[[quantity, dish]] = menu[dish]
  end

  def take_order
    show_menu
    get_dish
    puts "Would you like anything else?, type y for yes then hit Enter..."
    while check_answer == true
      get_dish
      puts "Would you like anything else?, type y for yes then hit Enter..."
    end
    repeat_order
    confirm_order
    end_call
  end

  def repeat_order
    order_total = 0
    order_information.each do |information, price|
      puts "So that's #{information[0]} x #{information[1]} at £#{price} each."
      puts "For a total of £#{price * information[0]}"
      order_total = order_total + (2 * price)
    end
  end

  def confirm_order
    puts 'Would you like to place this order'
    puts 'Enter y for Yes and n to start again, then hit Enter...'
    check_answer == true ? send_text : take_order    
  end

  def end_call
    puts "Thanks for calling #{takeaway.capitalize}, have a nice day!"
  end

end