class Confirmation
  attr_accessor :delivery_time

  def initialize
    @delivery_time = (Time.now + 3600).strftime("%I:%M %p")
  end

  def text
    "Thank you! Your order was placed and will be delivered before #{@delivery_time}"
  end
end
