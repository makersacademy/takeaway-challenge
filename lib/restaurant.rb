class Restaurant
  attr_accessor :twiliohelper

  def confirm
    delivery_time = (Time.new + 60*60).strftime("%H:%M")
    confirmation_msg = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    @twiliohelper.send(confirmation_msg)
  end
end
