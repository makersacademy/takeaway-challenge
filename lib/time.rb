class Time

  def time_in_an_hour
    (Time.now + 1 * 60 * 60).strftime("%I:%M %p")
  end

end
