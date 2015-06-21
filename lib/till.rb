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

end
