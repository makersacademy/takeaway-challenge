class Formatter

  def delivery_time_reformat(timestamp)
    if timestamp.hour < 23
      @delivery_hour = timestamp.hour + 1
    else
      @delivery_hour = 00
    end
    @delivery_min_str = timestamp.min.to_s
    if @delivery_min_str.length == 1
      @delivery_min_str.insert(0, "0")
    end
    @delivery_hr_str = @delivery_hour.to_s
    if @delivery_hr_str.length == 1
      @delivery_hr_str.insert(0, "0")
    end
    return "#{@delivery_hr_str}:#{@delivery_min_str}"
  end

  def format_change(pence)
    str = pence.to_s
     if str.length == 1
      str.insert(0, "00.0")
     elsif str.length == 2
      str.insert(0, "00.")
     elsif str.length >= 3
      str.insert(-3, ".")
    else
      ""
     end
  end


end
