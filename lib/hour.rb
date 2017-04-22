require 'date'

class Hour

  def eta_to_string
    @current_time = Time.now.strftime("%H:%M")
    hour = @current_time.split("")[1]
    return midnight if @current_time[0..1] == "23"
    @current_time.delete(hour).insert(1, (hour.to_i + 1).to_s)
  end

  def midnight
    @current_time.slice!(0..1)
    return @current_time.insert(0, "00")
  end

end
