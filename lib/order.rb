require_relative 'menu'
require 'date'
require 'twilio-ruby'

class Order

  attr_reader :final_order

  # put your own credentials here
  ACCOUNT_SID = 'ACbb9d79e8b89cc29c5363dde46532fcee' 
  AUTH_TOKEN = '485416945d5c976283c4a652ad691468' 
  # set up a client to talk to the Twilio REST API
  CLIENT = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

  def initialize(menu)
    @menu = menu
    @final_order = []
  end

  def add_order(dish_name, quantity)
    fail "Sorry, #{dish_name} is not available"\
     unless @menu.dish?(dish_name) 
    dish_obj = @menu.get_dish_obj(dish_name)
    @final_order.push({ dish: dish_obj, quantity: quantity })
  end

  def final_bill
    sum = 0
    @final_order.each do |item|
      sum += (item[:dish].price * item[:quantity])
    end
    send_delivery_message
    return sum
  end
  
  def send_delivery_message
    message = "Thank you! Your order was placed and will be delivered before 
      #{(Time.now + 60 * 60).strftime("%H:%M")}."
    puts message
    CLIENT.messages.create(  
      from: '+447449647144',       
      to: '+447438856372',
      body: message) 
  end

end
