class Message

  SECS_IN_HOUR = 3600

  def initialize(time = Time.now)
    @time = time
  end

  def time_one_hour_ahead
    new_time = @time + SECS_IN_HOUR
    new_time.strftime('%H:%M')
  end

  def confirmation_message
    "Thank you! Your order was placed and will be delivered before #{time_one_hour_ahead}"
  end
end
