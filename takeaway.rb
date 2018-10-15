require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Takeaway
  attr_reader :order, :check, :total, :meal

  def initialize(menu = Menu, meal = Meal)
    @order = []
    @check = []
    @menu = Menu.new
  end

  def display_menu(menu = menu)
    puts "'Go-Away' - Take-Away Menu"
    @menu.meals.each do |item|
      puts "#{item.number}: #{item.name}, £#{item.price}
      ---
      "
    end
  end

  def choose_meals(*stdin)
    $stdin == nil ? (choice = 0) : (choice = $stdin)
    while choice != 6 do
      puts "Please enter the number of the dish you would like to order.
      When you have finished your selection, press 6."
      choice = gets.chomp.to_i
      fail 'That is not a relevant item number.' if choice.between?(0,6) == false
      @order.push(choice) if choice.between?(1,5) == true
    end
  end

  def collate_check(order = @order, meal = Meal)
    @order = order
    @order.each do |choice|
      @check.push(Meal.new(1, "Pizza", 10)) if choice == 1
      @check.push(Meal.new(2, "Fries", 2)) if choice == 2
      @check.push(Meal.new(3, "Garlic Bread", 3)) if choice == 3
      end
    @check
  end

  def display_order(check = @check)
    puts "Your order was as follows:"
    @check = check
    @total = 0
    @check.each do |item|
      puts "#{item.number}: #{item.name}, £#{item.price}"
      @total += item.price
    end
    puts "Your order will cost a total of £#{total}"
    @total
  end

  def confirm_order
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    from = ENV['FROM_NUMBER'] # Your Twilio number
    to = ENV['TO_NUMBER'] # Your mobile phone number
    
    client.messages.create(
    from: from,
    to: to,
    body: "Go-Away TakeAway order confirmation. Your order will be delivered soon."
    )
  end

end

private

class Menu
  attr_reader :meals

  def initialize(meal = Meal)
    @meals = []
    @meals.push(Meal.new(1, "Pizza", 10))
    @meals.push(Meal.new(2, "Fries", 2))
    @meals.push(Meal.new(3, "Garlic Bread", 3))
  end

end

class Meal
  attr_reader :number, :name, :price

  def initialize(number, name, price)
    @number = number
    @name = name
    @price = price
  end

end