class OrderTime
  DELIVERY_DURATION = 3600

  def initialize(time = Time.new)
    @time = time
    @delivery_time = nil
  end

  def delivery_time
    @delivery_time = (@time + DELIVERY_DURATION)
    @delivery_time.strftime("%R")
  end

end
