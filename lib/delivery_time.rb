class DeliveryTime

  attr_reader :time

  def initialize(time = Time.new)
    @time = time
  end

  def set_hour
    @time.hour + 1
  end

  def set_minute
    return "0#{@time.min}" if @time.min < 10
    @time.min
  end

  def time_of_order
    "#{set_hour}:#{set_minute}"
  end

end
