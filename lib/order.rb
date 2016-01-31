class Order
  def initialize
    @save = {}
  end

  def order_placed(twilio)
    @twilio = twilio
    send_text("Thank you! Your order was placed "\
    "and will be delivered before #{delivery_time}")
  end

  attr_accessor :save

  private

  attr_reader :twilio

  def delivery_time
    (Time.now + 60*60).strftime("%H:%M")
  end

  def send_text(body)
    twilio.messages.create(from: Dotenv.load['FROM'], to: Dotenv.load['TO'], body:body)
  end
end