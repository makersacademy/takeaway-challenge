class SetTime
  attr_reader :hr1, :min1, :time1

  def initialize(time=Time.now)
    @time1 = time
    @hr1 = (time1.hour + 1).to_s
    if time1.min < 10
      @min1 = "0" + time1.min.to_s
    else
      @min1 = time1.min.to_s
    end
  end
end


# def in_one_hour
#   (Time.now + 3600).strftime("%H:%M")
# end
