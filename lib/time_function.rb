class TimeFunction
  def time_plus_one_hour
    t = Time.new + 3600
    t.strftime('%H:%M')
  end
end
