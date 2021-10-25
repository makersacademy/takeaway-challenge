
class Messenger

  def checkout
    delivery_time = (Time.now.hour + 1).to_s + ":" + Time.now.min.to_s
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

  def send_sms
  end
end