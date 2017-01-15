class Order
  attr_accessor :dishes, :twiliohelper

  def initialize
    @dishes = []
  end

  def total
    total = 0
    @dishes.each do |row|
      dish = row[:dish]
      quantity = row[:quantity]
      total += dish.price * quantity
    end
    total
  end

  def confirm
    delivery_time = (Time.new + 60*60).strftime("%H:%M")
    confirmation_msg = "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    @twiliohelper.send(confirmation_msg)
  end
end
