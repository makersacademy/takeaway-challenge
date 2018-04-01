require 'rubygems'
require 'twilio-ruby'
class Restaurant
  attr_reader :basket, :menu
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @bill = [0]
  end

  def order(name, quantity, expect_total)
    basket << (menu.dishes.assoc name) * quantity
    sum = menu.dishes[name] * quantity
    error = "Hey it should be #{sum} not #{expect_total}"
    raise error if sum != expect_total
    @bill << sum
    p "#{quantity}x #{name} added to the basket, total: £#{total}"
  end

  def todays_menu
    menu.dishes.each { |dish| puts dish }
    p "So... What would you like? It is all fairly fresh"
  end

  def basket_summary
    basket.each { |order| puts order }
    p "Total: #{total}"
  end

  def total
    @bill.sum
  end

  def checkout
    message = "Your order is complete and will arrive at #{(Time.new + 3600).strftime("%H:%M:%S")}, prepare £#{total} to pay the driver"
    send_text(message)
    @bill = []
    @basket = []
    p "Enjoy your meal!"
  end

  private

  def send_text(message)
    account_sid = 'AC5aa76e3c7ccd0c77f55ff9aab18210f0'
    auth_token = '126c49a5abafd240cd9eff57f6009ede'
    client = Twilio::REST::Client.new account_sid, auth_token

    from = '+441986232066'
    to = '+447450255468'

    client.messages.create(
      from: from,
      to: to,
      body: message
      )
  end
end
