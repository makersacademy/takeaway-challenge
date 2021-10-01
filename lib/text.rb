class Text

  attr_reader :time

  def initialize(t = Time)
    @t = t
    @time = nil
  end 

  def text(order)
    delivery_time
    "Thank you! Your order was placed and will be delivered before #{time}"
  end

  private 

  def delivery_time
    @t = @t.new + 1*60*60
    @time = @t.strftime("%H:%M")
  end
end