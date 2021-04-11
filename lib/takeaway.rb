require 'twilio-ruby'

class Takeaway

  attr_reader :items, :shoppingcart

  def initialize
    @items = 
    { "Margarita" => 8.99, "Vegetarian" => 9.99, "Pepperoni" => 10.99, 
    "Cheesecake" => 3.99, "Water" => 0.99 }

    @shoppingcart = []
  end

  def read_menu
    p "What would you like to order? We currently have...."
    p @items
  end

  def add(item)
    @shoppingcart << @items[item.capitalize] 
    # blocker: to convert it over to being a symbol, 
    # this wasn't needed actually. hash was the wrong values.
    "#{item.capitalize} added to your basket. The total currently is £#{total}"
  end

  def total
    @shoppingcart.reduce(:+).round(2)
  end

  def time
    time = Time.now + 3600 # seconds in an hour
    time.strftime("%k:%M")
  end

  def sendtext
   
    # removed my sid/auth/mobile numbers for upload
    account_sid = 'ACf213fd0e0968cad4cf1d53ef5e2fe301'
    auth_token = 'f3a00b928bb594b9847b5253a4d5092c'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+447723565836' # Your Twilio number
    to = '+447709018333' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! The total was £#{total} Your order was placed 
    and will be delivered before #{time}"
    )
  end
  
  def checkout  
    sendtext
    return "The total was: £#{total}"
  end
end
