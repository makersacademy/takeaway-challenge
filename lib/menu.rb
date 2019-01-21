require 'twilio-ruby'

class Menu

  def initialize (order = [])
    @order = []
    @dishes = [
    { name: "Chicpeas Jungle", price: "12,95" },
    { name: "Brocoli Bush", price: "9,95" },
    { name: "Aspargus Forest", price: "11,95" },
    { name: "Lentils Peak", price: "8,95" },
    { name: "Banana Curnicopia", price: "6,95" }
    ]
  end

  def display
    dishes.each_with_index do |dish, index|
      puts "#{index + 1} #{dish[:name].ljust(20)}  £#{dish[:price]}"
    end
  end

  def select (dish_index, quantity:1)
    dish_name = @dishes[dish_index - 1][:name]
    dish_price = @dishes[dish_index - 1][:price]
    dish_quantity = quantity
    @order.add_to_order(dish_name, dish_price, dish_quantity)
    puts dish_name
    puts dish_price
    puts dish_quantity
    puts "#{quantity} #{dish_name} has been added to your order"
  end

  def add_to_order
    add(dish_name, dish_price, dish_quantity)
    @order << { name: dish_name, price: dish_price, quantity: dish_quantity }
  end


  def check_order
    @order.each do |dish|
      @total += (dish[:price]*dish[:quantity])
      puts "#{dish[:quantity]} #{dish[:name].ljust(20)}  £#{dish[:price]}"
    end
    puts "Price #{@total}"
  end

  def confirm_order
  account_sid = "AC708f106145fd9692050918b75bc731ca" # Your Account SID from www.twilio.com/console
  auth_token = "602faeed5de05ac68900beb6b1ef5e3b"   # Your Auth Token from www.twilio.com/console

  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.messages.create(
      body: "Hello from Ruby",
      to: "+447787120180",    # Replace with your phone number
      from: "+441329800460")  # Replace with your Twilio number

  puts message.sid
  end

  private

  def dishes
    @dishes
  end
end
