class Timestamp
  def hour_from_now
    (Time.new + (60 * 60)).strftime("%H:%M")
  end
end
