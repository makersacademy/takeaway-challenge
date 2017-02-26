class TextConfirmation

  attr_reader :time

  def initialize(time = Time.now)
    @time = time
  end

  def order_finished(order)
    "Your #{order} will arrive at " + est_delivery_time
  end

  def est_delivery_time
    "#{time.hour + 1}.#{time.min}"
  end

end
