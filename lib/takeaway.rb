require 'twilio-ruby'
require_relative 'menu'
require_relative 'customer'
require_relative 'order'
require_relative 'messenger'

class Takeaway
  attr_reader :inputs
  def initialize
    @inputs = ARGV
    @accont_sid = @inputs[0]
    @auth_token = @inputs[1]
    @from_number = @inputs[2]
    @menu_data = [ { id: 1, name: 'Chicken Korma', description: 'Mild cream based curry', price: 599 },
                   { id: 2, name: 'Vindaloo', description: 'Very hot curry', price: 699 },
                   { id: 3, name: 'Tikka', description: 'Dry curry', price: 499 } ]
    @menu = Menu.new(@menu_data)
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @messenger = nil
  end

  def start
   welcome
   loop do
     name = get_name
     customer_number = get_number
     customer = Customer.new(name, customer_number, Order.new(@menu))
     puts "Please select what you'd like from our menu"
     customer.select_dishes(get_selections)
     puts ""
     puts customer.print_order
     if check_order
       customer.varify_order
       send_message(@client, customer.order, from_to_nums)
     else
       puts "\nPlease re-enter your details and selection\n\n"
     end
   end
   goodbye
  end

  def check_order
    puts "\nIs this correct?"
    answer = gets.chomp.downcase
    answer.include?('y')
  end

  def from_to_nums
    { from: @from_number, to: customer_number }
  end

  def send_message(client, customer, from_to)
    Messenger.new(client, customer.order, from_to).send
  end

  def welcome
    message = "*----------------------------------*\n" +
              "|  Welcome to Vindayou take away!  |\n" +
              "*----------------------------------*\n"
    puts message
  end

  def goodbye
   puts "Thanks for your order, you should receive"
   puts "a text with an estimated delivery time!"
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
    selection_instructions
    selections = []
    loop do
      puts "\nEnter selection: "
      answer = gets.chomp
      break if answer.to_s.downcase == 'done'
      selections << answer.to_i
    end
    selections
  end

  def selection_instructions
    puts "\nPlease enter the numbers of the things you want"
    puts "to add a selection. When you're finished.\n"
    puts "When you're finished enter 'done' to continue."
  end
end
