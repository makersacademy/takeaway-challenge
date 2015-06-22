class Till # could call it something like Summer, Calculator...?
  attr_reader :items
  def initialize itemizable
    @items = itemizable.items
  end

  def total
    @items.values.inject(:+)
  end

  def process message_centre, customer_details # this does not belong in this class
    message_centre.process customer_details
  end
end
