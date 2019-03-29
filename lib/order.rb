require 'menu'

class Order
  def initialize
    @menu_instance = Menu.new
    @total = 0
  end

  def check_total(order = @menu_instance.order)
    order.each { |item|
      @total += item[:price]
    }
    @total
  end

  def send_text
    @client.messages.create
  end
end

require("bundler")
Bundler.require()

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.messages.create(
  to: ENV["MY_PHONE_NUMBER"],
  from: "+441594372067",
  body: "Your order will be delivered in an hour"
  )
