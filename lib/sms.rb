class SMS

  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end
end