require 'twilio-ruby'

class Order
attr_reader :menu, :order, :total, :total_items, :meal_choice, :meal_count, :total_cost

def initialize
  @menu = {Pizza: 10, Pasta: 7.50, Cheesesteak: 8.50, Fries: 3.50, Donut: 2.50}
  @order = []
  @total_cost = 0
  @total_items = 0
end

def take_order
  p "What would you like to order?"
  @menu.map{|key,value| p "#{key.to_s}: £#{value}"}
  meal_choice = gets.chomp.capitalize.to_sym
  if !@menu.include?(meal_choice)
    p "Unfortunately we're out of your selected product. Please choose one of the following:"
    take_order
  else
    p "How many #{meal_choice} would you like?"
    meal_count = gets.chomp.to_i
    create_order(meal_choice, meal_count)
  end
  p "Enter 1 to continue ordering or 9 to checkout!"
    answer = gets.chomp.to_i
    until answer == 1 || answer == 9
      answer = gets.chomp.to_i
    end
  answer == 1 ? take_order : show_order     
end

def create_order(meal_choice, meal_count)
  dish_total = @menu[meal_choice] * meal_count 
  order << [meal_choice.to_s, meal_count, dish_total]
  calc_total(order)
end

def calc_total(order)
  order.map{|x,y,z| @total_items += y; @total_cost += z}
end

def show_order
  p "You have #{@total_items} items for a total of £#{@total_cost}."
  "#{@order.map{|x,y| p "#{x} x #{y}"}}"
  text_confirm
  end
end

def text_confirm
  p "Enter SMS if you would like a text to confirm your order, else just press enter"
  text = gets.chomp.upcase
  text == "SMS" ? send_sms : exit
end

def send_sms
  account_sid = ENV["TWILIO_SID"]
  auth_token = ENV["TWILIO_TOKEN"]
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+442895072242' # Your Twilio number
  to = ENV["MY_NUM"] # Your mobile phone number

  client.messages.create(
  from: from,
  to: to,
  body: "Hey there, hungry homie.\n"  "Your order #{@order.map{|x,y| p "#{x} x #{y}" }} will be with you in about 30 minutes.\n" "Thank you for your order!"
  )
end


# order = Order.new
# order.take_order
