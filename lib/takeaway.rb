require_relative 'current_order'
require 'twilio-ruby'

class Takeaway

  attr_reader :menu

  def initialize
    @menu = [{ item: 'Mega Breakfast', price: 6.75 },
              { item: 'Full English Breakfast', price: 6.65 },
              { item: 'Light Breakfast', price: 4.55 },
              { item: 'Veggie Breakfast', price: 5.95 },
              { item: 'Breakfast Special', price: 6.85 },
              { item: 'Cheeseburger', price: 7.25 },
              { item: 'BBQ Burger', price: 7.85 },
              { item: 'Mega Burger', price: 8.75 },
              { item: 'Vegatarian Burger', price: 5.95 }]
    @current_order = CurrentOrder.new
  end

  def choose_meal(meal)
    @current_order.add_item(@menu.find { |n| n[:item] == meal })
  end

  def confirm_order
    @current_order.total
  end

  def pay_for_order
    send_message
    @current_order.clear_order
  end

 private

  def send_message
    account_sid = 'AC4386d4aa8e4ba2fbc1025275b943c9c4'
    auth_token = '4cb57adcbb47f5ac9e66a9cffc8c7f30'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+447782549143' # Your Twilio number
    to = '+447777777777' # Your mobile phone number

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{Time.new.hour + 1}:#{Time.new.min}"
      )
  end

end
