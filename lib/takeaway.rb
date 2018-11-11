require_relative './menu.rb'
class Takeaway
  attr_reader :inputs
  def initialize
    @inputs = ARGV
    @menu_data = [ { id: 1, name: 'Chicken Korma', description: 'Mild cream based curry', price: 599 },
                   { id: 2, name: 'Vindaloo', description: 'Very hot curry', price: 699 },
                   { id: 3, name: 'Tikka', description: 'Dry curry', price: 499 } ]
    @menu = Menu.new(@menu_data)
  end

  def start
   welcome
   name = get_name
   number = get_number
   order = Order.new(@menu)
   customer = Customer.new(name, number, order)
   puts "Please select what you'd like from our menu"
   customer.select_dishes(get_selections)
   puts ""
   puts customer.print_order
   puts ""
   puts "Is this correct?"
   answer = gets.chomp.downcase
   if answer.include?('y')
     customer.varify_order
   end

  end

  def welcome
    message = "*----------------------------------*\n" +
              "|  Welcome to Vindayou take away!  |\n" +
              "*----------------------------------*\n"
    puts message
  end

  def menu_header
    puts "Our menu:"
    puts "---------"
  end

  def get_name
    puts "What is your name?"
    gets.chomp.downcase
  end

  def get_number
    puts "What is your number?"
    gets.chomp.downcase
  end

  def print_menu
    menu_header
    @menu.print
  end

  private
  def menu_header
    puts "Our menu:"
    puts "---------"
  end

  def get_selections
    print_menu
    puts ""
    puts "Please enter the numbers of the things you want."
    puts "Press enter to add a selection. When you're finished"
    puts "enter 'done' to continue'."
    selections = []
    loop do
      puts "Enter selection: "
      answer = gets.chomp
      puts answer.to_s == 'done'
      break if answer.to_s.downcase == 'done'
      selections << answer.to_i
    end
    selections
  end
end

Takeaway.new.start
