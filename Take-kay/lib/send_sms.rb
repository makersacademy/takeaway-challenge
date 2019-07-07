require ("bundler")
Bundler.require()
require_relative 'receipt'
require_relative 'order'

module Text


  def send_sms(order, total_price)
  account_sid = "AC13146fc0948c7b0a80620342784fb7b4"
  auth_token = "38f00c1ba8e62fcd075a8efe2583eb0c"
  client = Twilio::REST::Client.new(account_sid, auth_token)


  client.messages.create(
  to: '+447787628699',
  from: '+441622321259',
  body: "[Delivery notification] OVERPRICED BANANA HOUSE & wings. Your order will be delivered today at: #{time }. Your orders include: #{order}
  The total is: £#{total_price.round(2)}."

  )
  end

  def time
    delivery_time = Time.new + (60 * 60)
    delivery_time.strftime("%k:%M %p")
  end
end
