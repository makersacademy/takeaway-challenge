#MENU
require 'twilio-ruby'
require 'dotenv'
Dotenv.load
require_relative 'order'

class Menu

  attr_reader :selection, :chosen_dishes

  def initialize
    @chosen_dishes = []
    @sorry = "Sorry but that not a valid command"
    main_menu
  end

  def main_menu
    line = "|"
    puts "=" + "Please select an option or press q to quit".center(50) + "="
    puts line + "1. Starters".center(50) + line
    puts line + "2. Mains".center(50) + line
    puts line + "3. Desserts".center(50) + line
    puts line + "4. Drinks".center(50) + line
    (puts line + "5. See total".center(50) + line) if @chosen_dishes != []
    (puts line + "6. Checkout and pay".center(50) + line) if @chosen_dishes != []
    @menu_select = gets.chomp
    main_menu_select(@menu_select)
  end

  def main_menu_select(menu_select)
    case menu_select
    when "1"
      show_menu(starters)
    when "2"
      show_menu(mains)
    when "3"
      show_menu(desserts)
    when "4"
      show_menu(drinks)
    when "5"
      total_price
    when "6"
      total_price
    when "q"
      exit
    end
  end

  def show_menu(menu_select)
    puts "=======".center(50)
    puts "MENU".center(50)
    puts "=======".center(50)
    @chosen_menu = menu_select
    @number = 0
    menu_select.each do |dish|
      puts "#{@number += 1}. #{dish[:name]}".ljust(30) + "£#{dish[:price]}"
    end
    dish_selection
  end

  def dish_selection
    selection_string = "\nType in your selection or press 'q' to go back to main menu"
    selection = "1"
    until selection == "q" do
      if selection.to_i >= 1 && selection.to_i <= @number
        puts selection_string
        selection = gets.chomp
        choose_dish(selection.to_i - 1) if selection.to_i != "q"
      else
        puts @sorry
        break
      end
    end
    main_menu
  end

  def choose_dish(dish_selection)
    @chosen_dishes << @chosen_menu[dish_selection]
  end

  def total_price
    total_price = 0
    puts "\n" + "Orders".ljust(30) + "Price"
    @chosen_dishes.each do |dish|
      total_price += dish[:price].to_f
      puts "#{dish[:name]}".ljust(30) + " + #{dish[:price]}"
    end
    puts "\n" + "TOTAL".ljust(30) + "%.2f" % total_price
    puts "======================================"
    if @menu_select == "5"
      main_menu
    elsif @menu_select == "6"
      puts "press enter to finalize your order or type q to go back"
      answer = gets.chomp
      if answer == ""
        send_text_message
        exit
      elsif answer == "q"
        main_menu
      else puts @sorry
      end
    else exit
    end
  end

  def send_text_message
    time = Time.new + 3600
    account_sid = ENV.fetch('TWILIO_ACCOUNT_SID')
    auth_token = ENV.fetch('TWILIO_ACCOUNT_AUTH')

    @twilio_client = Twilio::REST::Client.new account_sid, auth_token

    @twilio_client.account.sms.messages.create(
      :from => ENV['TWILIO_FROM_NUM'],
      :to => ENV['TWILIO_TO_NUM'],
      :body => "Thank you for your order. It will be delivered by #{time.strftime("%H:%M")}")
  end

  def starters
    @starters =
    [{name: "Prawn King", price: "5.10"},
      {name: "Skinny Dipper", price: "3"},
      {name: "On A Spring Roll", price: "3"},
      {name: "Who Ham I", price: "6.50"},
      {name: "Sushi Me", price: "8"}]
  end

  def mains
    @mains = [
      {name: "Kung Fu Chicken", price: "15.25"},
      {name: "Kabab Banter", price: "12.60"},
      {name: "Puke-A-Pie", price: "10.15"},
      {name: "Pitzar", price: "16"},
      {name: "Hamlet", price: "16.50"},
      {name: "Birds The Word", price: "18.95"},
      {name: "Piggy On", price: "14.80"}]
  end

  def desserts
    @desserts = [
      {name: "Cheesy Cake", price: "5.25"},
      {name: "I Scream", price: "6.65"},
      {name: "Strawberry Hill", price: "7.40"},
      {name: "Cake Is A Lie", price: "6.50"},
      {name: "Orange Appeal", price: "8.95"}]
  end

  def drinks
    @drinks = [
      {name: "Cola Coca", price: "3.40"},
      {name: "Spite", price: "3.30"},
      {name: "John Lemon", price: "3.25"},
      {name: "For Milk Shake", price: "4"},
      {name: "Coco Latte", price: "4.10"}]
  end
end

menu = Menu.new
