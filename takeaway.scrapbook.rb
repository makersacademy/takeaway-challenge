require 'twilio-ruby'

class Takeaway
  attr_reader :number, :name, :price, :menu, :check, :order

  def initialize(meal = Meal, check = Check)
  end

  def create_menu
    @menu = []
    create_meals
    display_menu
  end

  def create_order
    @check = Check.new
    @check.place_order
    @order = @check.order
    @check.collate_check(@order)
    display_check(@check)
    confirm_message
  end

  def create_meals
    @menu.push(Meal.new(1, "Pizza", 10))
    @menu.push(Meal.new(2, "Fries", 2))
    @menu.push(Meal.new(3, "Garlic Bread", 3))
  end

  def display_menu #
    puts "'Go-Away' - Take-Away Menu"
    @menu.each do |item|
      puts "#{item.number}: #{item.name}, £#{item.price}
      ---
      "
    end
  end

  def display_check(check = Check) #
    puts "Your order was as follows:".center(60)
    total = 0
    @bill = check.check
    @bill.each do |item|
      puts "#{item.number}: #{item.name}, £#{item.price}".ljust(60)
      total += item.price
    end
    puts "Your order will cost a total of £#{total}"
    total
  end

  def confirm_message
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

class Meal
  attr_reader :number, :name, :price, :menu

  def initialize(number, name, price)
    @number = number
    @name = name
    @price = price
  end
end

class Check
  attr_reader :check, :order, :number, :name, :price

  def initialize
    @check = []
    @order = []
  end

  def place_order
    choice = 0
    while choice != 6 do
      puts "Please enter the number of the dish you would like to order.
      When you have finished your selection, press 6."
      choice = gets.chomp.to_i
      fail 'That is not a relevant item number.' if choice.between?(0,6) == false
      @order.push(choice) if choice.between?(1,5) == true
    end
  end

  def collate_check(order)
    order.each do |choice|
    @check.push(Meal.new(1, "Pizza", 10)) if choice == 1
    @check.push(Meal.new(2, "Fries", 2)) if choice == 2
    @check.push(Meal.new(3, "Garlic Bread", 3)) if choice == 3
    end
  end

end
