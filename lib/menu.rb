require 'twilio-ruby'
class Menu

  attr_reader :dishes, :order

  def initialize
    @dishes = { pizza: 6.00 ,
      pasta: 8.00 ,
      chips: 3.00 ,
      burger: 10.00 ,
      lobster: 25.00 ,
      oysters: 20.00 }
    @order = []
  end

  def print_menu
    @dishes
  end

  def select(item)
    @order << item
  end

  def price(item)
    dish = item.to_sym
    @dishes[dish]
  end

  def calculate_total
    total = 0
    receipt = ""
    @order.each do |item|
      dish = item.to_sym
      receipt += "#{item} #{@dishes[dish]}, "
      total += @dishes[item.to_sym]
    end
    copy = "#{receipt}Total: #{total}"
  end

  def checkout
    send_text
  end

end

private

def send_text
  time = Time.now
  future_time = time + ((@order.count)*480)
  delivery_time = future_time.strftime("%I:%M")
  account_sid = 'AC86548f9527c898cfeeb3d566b1c98587'
  auth_token = '4eecdbf45b9a6433d78d16d808e8171b'
  client = Twilio::REST::Client.new(account_sid, auth_token)

  from = '+441163264476' # Your Twilio number
  to = '+447000000000' # Your mobile phone number

  client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order has been placed and will be delivered by #{delivery_time}."
  )
  "Text sent"
end
