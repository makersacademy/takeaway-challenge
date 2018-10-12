require_relative "texter"

class Restaurant

  def initialize(texter = Texter.new)
    @texter = texter
  end

  def place(order, total)
    check_total(order, total)
    send_text(success_message(order))
  end

  private

  def check_total(order, total)
    raise("Incorrect total.") unless total == order.total
  end

  def hour_from_now
    hour = 1 * 60 * 60
    (Time.now + hour).strftime("%H:%M on %d/%m/%Y")
  end

  def success_message(order)
    "Your order totalling £#{order.total} was successful, and will arrive at #{hour_from_now}."
  end

  def send_text(message)
    @texter.send(message)
  end

end
