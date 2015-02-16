require 'twilio-ruby'

class Takeaway

  def process_order(order, payment_amount, name)
    if payment_amount < order.total_price || payment_amount > order.total_price
      raise "Please pay the correct amount"
    else
      "Thanks for your order"
      send_text
    end 
  end

  def send_text
    time = Time.new 
    hour = time.hour + 1
    min = time.min 
    account_sid = 'AC87b8e4e94bfb91d008b33f5490fe2005'
    auth_token = 'b1bb60cfe62e8e512215b1291be3ad29'
    @client = Twilio::REST::Client.new account_sid, auth_token
 
    message = @client.account.messages.create(:body => "Your order will arrive at #{hour}:#{min}",
    :to => "+447425162739",
    :from => "+441412804269")
    puts message.to
  end

end


 
