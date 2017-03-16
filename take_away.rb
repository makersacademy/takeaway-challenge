# Note, this is not part of the main project. It serves as a user interface to test the application in the terminal
require 'dotenv/load'
require'./lib/bill'
require './lib/customer'
require './lib/customer_notification'
require './lib/email_client'
require './lib/order_item'
require './lib/order'
require './lib/twilio_client'
require './lib/menu'
require 'csv'

class TakeAway

  def initialize
    @menu = Menu.new(OrderItem)
    @bill = Bill.new(@menu)
    greet
    get_customer_details
    show_menu_get_order
    send_order
    say_bye
  end

  def greet
    puts "Welcome to #{ENV['REST_NAME']}!!"
    puts File.read(load_path)
  end

  def get_customer_details
    puts "Please tell me your name."
    name = gets.chomp
    puts "Thanks. How would you like to be notified about your order?"
    option = 0

    while option != "1" && option !="2" do
      puts "Please choose option 1 or 2"
      puts "1. SMS"
      puts "2. Email"
      option = gets.chomp
    end
    if(option == "1")
      method = TwilioClient.new
    elsif (option == "2")
      method = EmailClient.new
    end
    puts "Great, please enter your contact details for this method."
    contact_details = gets.chomp
    puts "Thanks!"
    @customer = Customer.new(name: name, method: method, identification: contact_details)
    @order = Order.new(@customer, @menu)
  end

  def show_menu_get_order
    option = ""
    while option != "finish" do
      print_ui_menu
      option = gets.chomp
      if option == "total"
        puts "Your bill is currently £#{@order.total(@bill)}"
        next
      end
      if option == "basket"
        if @order.items.length == 0
          puts "Your basket is empty"
          next
        end
        puts "=======Basket======="
        puts @order.print_order
        next
      end
      if option != "finish"
        puts "How many would you like?"
        quantity = gets.chomp
        process(option.to_i - 1,quantity)
    end
    end
  end

  def print_ui_menu
    puts "=======Menu======="
    puts @menu.print_menu
    puts "Enter an item number to add it to your order."
    puts "Enter 'total' to get your current order total."
    puts "Enter 'basket' to show your current order."
    puts "Enter 'finish' to complete your order."
  end

  def process(option, quantity)
    @order.add(OrderItem.new(name: @menu.items[option].name, quantity: quantity))
    puts "You added #{@menu.items[option].name} (#{quantity})"
  end

  def send_order
    @order.send
  end

  def say_bye
    puts "Goodbye, thank you for ordering! Come again soon!"
    puts File.read(load_path)

  end

  def load_path
    File.expand_path("../assets/logo.txt", __FILE__)
  end

end

ta = TakeAway.new
