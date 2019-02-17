class Text
  attr_reader :time

  def initialize(time = Time.new)
    @time = time
  end

  def generate
    delivery_time = @time + 60 * 60
    "Your order has been placed. Your dins will be with you at #{delivery_time}"
  end

end
