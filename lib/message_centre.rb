class MessageDespatch
  DEFAULT_MESSAGE = "Thank you for your order!"
  attr_accessor :message

  def initialize messenger, message=DEFAULT_MESSAGE
    @messenger = messenger
    @message   = message
  end

  def generate_message
    "#{message} Your order will be with you by #{time_in_one_hour}."
  end

  def process customer_details
    @messenger.send_message generate_message, customer_details # assumes send_message interface on notifier
  end

  def time_in_one_hour
    t = Time.now + 60*60
    t.strftime("%I:%M%p")
  end
end
