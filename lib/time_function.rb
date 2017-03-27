class TimeFunction #responsible for returning the time plus one hour

  def time_plus_one_hour
  t = Time.new + 3600
  t.strftime('%H:%M')
  end

end
