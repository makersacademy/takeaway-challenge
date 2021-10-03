class Delivery 

  attr_reader :future_time

  def delivery_time
    @future_time = (Time.now + 1 * 60 * 60).strftime("%H:%M")
  end
end
