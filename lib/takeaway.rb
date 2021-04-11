require 'twilio-ruby'

class Takeaway

  attr_reader :items, :shoppingcart

  def initialize
    @items = {margarita: 8.99, vegetarian: 9.99, pepperoni: 10.99, cheesecake: 3.99, water: 0.99}
    @shoppingcart = []
  end

  def add(value)
    @shoppingcart << @items[value.to_sym] #stuck trying to convert it over to being a symbol
  end

  def total
    @shoppingcart.reduce(:+)
  end

  def complete?
    time = Time.now + 3600 # seconds in an hour
    account_sid = 'ACf213fd0e0968cad4cf1d53ef5e2fe301'
    auth_token = 'f3a00b928bb594b9847b5253a4d5092c'
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    from = '+447723565836' # Your Twilio number
    to = '+447709018333' # Your mobile phone number
    
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{time}"
    )
  end 

end