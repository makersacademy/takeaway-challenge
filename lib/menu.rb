require 'twilio-ruby'
class Menu

  attr_reader :dishes, :order, :quantity

  def initialize
    @dishes = { pizza: 6.00 ,
      pasta: 8.00 ,
      chips: 3.00 ,
      burger: 10.00 ,
      lobster: 25.00 ,
      oysters: 20.00 }
    @order = {}
  end

  def print_menu
    @dishes
  end

  def select(item)
    dish = item.to_sym
    @order[item] = @dishes[dish]
  end

  def calculate_total

  end

  # def send_text
  #   account_sid = 'AC86548f9527c898cfeeb3d566b1c98587'
  #   auth_token = '4eecdbf45b9a6433d78d16d808e8171b'
  #   client = Twilio::REST::Client.new(account_sid, auth_token)
  #
  #   from = '+441163264476' # Your Twilio number
  #   to = '+447950843624' # Your mobile phone number
  #
  #   client.messages.create(
  #     from: from,
  #     to: to,
  #     body: "Thank you for your order!"
  #   )
  #   "Text sent"
  # end

end
