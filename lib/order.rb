class Order

  attr_reader :selection

  def initialize
    @selection = []
  end

  MESSAGE = "Thank you! Your order was placed and will be delivered before "

  def notification(time_of_order)
    MESSAGE + (time_of_order + 10 * 60).strftime("%I:%M%p").to_s
  end

  def select(item, qty)
    @selection << { dish: item, qty: qty }
  end

end
