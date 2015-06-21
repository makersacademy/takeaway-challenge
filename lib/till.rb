class Till # could call it something like Summer, Calculator...?
  def initialize itemizable, notifier
    @items = itemizable.items
    @notifier = notifier
  end

  def total
    @items.values.inject(:+)
  end

  def generate_message
    "Thank you for your order!"
  end

  def notify
    @notifier.send_message generate_message # assumes send_message interface on notifier
  end

  def items
    @items
  end

end
