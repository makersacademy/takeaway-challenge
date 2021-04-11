require 'twilio-ruby'

class Takeaway

  attr_reader :items, :shoppingcart

  def initialize
    @items = { "Margarita" => 8.99, "Vegetarian" => 9.99, "Pepperoni" => 10.99, "Cheesecake" => 3.99, "Water" => 0.99 }
    @shoppingcart = []
  end

  def read_menu
    p "What would you like to order? We currently have...."
    p @items
  end

  def add(item)
    @shoppingcart << @items[item.capitalize] # stuck trying to convert it over to being a symbol, this wasn't needed actually. hash was the wrong values.
    "#{item.capitalize} added to your basket"
  end

  def total
    @shoppingcart.reduce(:+)
  end

  def time
    time = Time.now + 3600 # seconds in an hour
    time.strftime("%k:%M")
  end

  def sendtext
   
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    from = '' # Your Twilio number
    to = '' # Your mobile phone number
    
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! The total was #{total} Your order was placed 
    and will be delivered before #{time}"
    )
  end 
end
