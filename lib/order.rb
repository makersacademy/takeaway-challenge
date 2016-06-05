# require 'rubygems'
# require 'twilio-ruby'

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

    

    # account_sid = 'AC5a0ec0b92a0c1d9afafa12aa99484109'
    # auth_token = '1f2b5fadaed64b3b4b1459830aeeb229'

    # # # # set up a client to talk to the Twilio REST API
    # @client = Twilio::REST::Client.new account_sid, auth_token

    # # # alternatively, you can preconfigure the client like so
    # # Twilio.configure do |config|
    # #   config.account_sid = account_sid
    # #   config.auth_token = auth_token
    # # end

    # # # and then you can create a new client without parameters
    # # @client = Twilio::REST::Client.new

    # @client.messages.create(
    #   from: '+15005555006',
    #   to: '+447733366818',
    #   body: 'Hey there!'
    # )



    "Order has been placed.  You will receive your order in 1 hour."
  end

end

# order = Order.new
# order.add_dishes([[1,1], [3, 2], [1,1]])
# p order.place_order

