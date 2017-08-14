class SetTime
  attr_reader :hr1, :min1, :time1

  def initialize
    @time1 = Time.now
    @hr1 = (time1.hour + 1)
    if time1.min < 10
      @min1 = "0" + time1.min.to_s
    else
      @min1 = time1.min
    end
  end
end
