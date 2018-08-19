class DeliveryTime
  HOUR_DELAY = 1

  def initialize(time_klass = Time)
    @time_klass = time_klass
  end

  def generate_time
    time = @time_klass.now
    date_formatter(time)
  end

  private

  def date_formatter(delivery_time)
    mins = delivery_time.min.to_s
    hour = (delivery_time.hour + HOUR_DELAY).to_s

    mins.length < 2 ? (mins = "0#{mins}") : mins
    hour.length < 2 ? (hour = "0#{hour}") : hour
    formatted_date = "#{hour}:#{mins}"
  end
end
