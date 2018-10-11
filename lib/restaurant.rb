require_relative "texter"

class Restaurant

  def initialize(texter = Texter.new)
    @texter = texter
  end

  def place(order, total)
    raise("Incorrect total.") unless total == order.total
    message = "Your order totalling £#{order.total} was successfully placed at #{Time.now.strftime("%H:%M on %d/%m/%Y")}. It will be with you soon!"
    send_text(message)
  end

  def send_text(message)
    @texter.send(message)
  end

end
