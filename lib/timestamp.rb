class Timestamp
  def hour_from_now
    time = (Time.new + (60*60)).strftime("%H:%M")
  end
end
