require './docs/menu'
require 'twilio-ruby'

class Order
  attr_reader :menu_list, :pending, :total_price

  def initialize
    @menu_list = []
    @pending = []
    @completed = []
    @total_price = 0
  end

  def menu
    # load menu_list that is created and edited by the Menu class.
    file = File.open("menu_data.csv", "r")
    file.readlines.each do |line|
      dish_name, dish_price = line.chomp.split(', ')
      @menu_list << { dish_name: dish_name, dish_price: dish_price.to_i }
    end
    file.close
    # print loaded menu_list.
    @menu_list
  end

  def add(dish_name)
    @dish_order = dish_lookup(dish_name)
    @pending << @dish_order
    @total_price += @dish_order[:dish_price]
  end
  
  def dish_lookup(dish_name)
    @menu_list.find { |hash| hash[:dish_name] == dish_name }
  end

  def delete(dish_name)
    delete_order_hash = dish_lookup(dish_name)
    @pending.delete_if { |hash| hash == delete_order_hash }
    @total_price -= delete_order_hash[:dish_price]
  end
  
  def complete
    @completed = @pending
  end

  def send_sms
    fail 'Cannot send sms until order is placed' if !@completed = @pending
    account_sid = 'AC15ecbee19235321da77ab240d55e183b'
    auth_token = '6194352224829f0f5aa12dd281f2cda6'
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    from = '+447897034894' # Your Twilio number
    to = '+447833297790' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered within 1 hour."
    )
  end

end
