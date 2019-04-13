require 'twilio-ruby'
class Menu

  attr_reader :dishes, :order, :quantity

  def initialize
    @dishes = [{ name: "Pizza", price: 6.00 },
      { name: "Pasta", price: 8.00 },
      { name: "Chips", price: 3.00 },
      { name: "Burger", price: 10.00 },
      { name: "Lobster", price: 25.00 },
      { name: "Oysters", price: 20.00 }]
    @order = []
    @quantity = []
  end

  def print_menu
    @dishes
  end

  def select(item)
    @order << item
  end

  def send_text
    account_sid = 'AC86548f9527c898cfeeb3d566b1c98587'
    auth_token = '4eecdbf45b9a6433d78d16d808e8171b'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441163264476' # Your Twilio number
    to = '+447950843624' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you for your order!"
    )
    puts "Text sent"
  end

end
