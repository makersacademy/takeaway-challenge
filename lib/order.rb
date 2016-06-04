require 'twilio-ruby'

class Order

  attr_reader :dishes
  attr_reader :placed

  def initialize
    @dishes = {}
    @placed = false
  end

  def add_dishes(selections)
    selections.each do |dish, quantity| 
      dishes.has_key?(dish) ? dishes[dish] += quantity : dishes[dish] = quantity
    end
    dishes
  end

  def show_dishes
    return dishes
  end

  def place_order
    @placed = true

    

    account_sid = 'ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

    # # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    # # alternatively, you can preconfigure the client like so
    # Twilio.configure do |config|
    #   config.account_sid = account_sid
    #   config.auth_token = auth_token
    # end

    # # and then you can create a new client without parameters
    # @client = Twilio::REST::Client.new




    "Order has been placed.  You will receive your order in 1 hour."
  end

end

order = Order.new
order.add_dishes([[1,1], [3, 2], [1,1]])
p order.place_order

