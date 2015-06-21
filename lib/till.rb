class Till # could call it something like Summer, Calculator...?
  DEFAULT_MESSAGE="Thank you for your order! Your food will arrive by"
  attr_accessor :message
  attr_reader :items
  def initialize itemizable, notifier
    @items = itemizable.items
    @notifier = notifier
    @message = DEFAULT_MESSAGE
  end

  def total
    @items.values.inject(:+)
  end

  def process message_centre
    message_centre.process self.total
  end

  def time_in_one_hour # to messenger?
    Time.now + 60*60
  end

  def generate_message # to messenger?
    "#{message} #{time_in_one_hour}."
  end

  def notify
    @notifier.send_message generate_message # assumes send_message interface on notifier
  end


end
