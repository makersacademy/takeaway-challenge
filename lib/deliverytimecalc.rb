class DeliveryTimeCalc

  def add_one_hour
    now = Time.new
    hour = now.strftime("%H").to_i
    minute = now.strftime("%M")

    "#{hour + 1}:#{minute}"
  end

end
