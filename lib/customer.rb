require 'twilio-ruby'

class Customer

  attr_reader :order

  def initialize
    @order = []
  end

  def add_to_order(dish, number = 1)
    number.times { @order << dish }
  end

  def order_total
    total = 0
    @order.each { |dish| total += dish.price }
    total
  end

  def reciept
    @order.each { |dish| puts "#{dish.name} : £#{'%.2f' % (dish.price / 100)}" }
  end

  def complete_order
    t = Time.new + (60 * 60)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACC_SID'],
      ENV['TWILIO_AUTH_TOKEN'])
    message = "You're order has been recived and will be with you at"
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUM'],
      to: ENV['PHONE'],
      body: "#{message} #{t.strftime('%R')}"
    )
  end
end
