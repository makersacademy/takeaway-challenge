require 'twilio-ruby'

class Order
  attr_reader :order, :menu

  def initialize(menu)
    @order = []
    @menu = menu
  end

  def add_dish(dish)
    @order << menu.dish_list.find { |menu_item| menu_item.name == dish }
  end

  def total_price
    @order.map(&:price).sum
  end

  def check_price(price)
    raise "Incorrect price" unless  price == total_price
    true
  end

  def complete
    send_message
  end

  private

  def account_sid
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
  end

  def auth_token
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
  end

  def twilio_client
    @twilio_client ||= Twilio::REST::Client.new account_sid, auth_token
  end

  def send_message
    twilio_client.messages.create(
      from: '',
      to: '',
      body: message
    )
  end

  def message
    "Thank you! Your order was placed and will be delivered before 18:52"
  end
end
