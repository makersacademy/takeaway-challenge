class Order
  
  DELIVERY = 2700
  
  def initialize(time = Time.new)
    @time = time
  end

  def delivery_time 
    duration = @time + DELIVERY
    duration.strftime("%H:%M")
  end

end
