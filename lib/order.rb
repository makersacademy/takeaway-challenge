class Order

def initialize
  @list_of_dishes = {"pizza"=>10, "pasta"=>8, "garlic bread"=>5}
  @order = {}
end

def display_menu
  p @list_of_dishes
end

def add_to_order(item)
  item.each do |key, value|
  @order[key] = value
  end
end

def display_order
  p @order
  p @order.length
end

def message
  require 'twilio-ruby'
  account_sid = ''
  auth_token = ''
  client = Twilio::REST::Client.new(account_sid, auth_token)
  from = '' # Your Twilio number
  to = '' # Your mobile phone number
  client.messages.create(
  from: from,
  to: to,
  body: "Thank you! Your order was placed and will be delivered before 18:52")
end

def checkout_order
 p "You have ordered #{@order}"
 p "Thank you for your order!"
message
 p "You will shortly receive a text confirming your order saying"
end

end
