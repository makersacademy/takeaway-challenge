# Calculates the time of delivery

class DeliveryTime

  def initialize
    @time = Time.now
  end

  DELIVERY_TIME = 3600
  attr_reader :time

  def calculate
    estimated_time = self.time += DELIVERY_TIME
    estimated_time.strftime("%H:%M")
  end


  private

  attr_writer :time

end
