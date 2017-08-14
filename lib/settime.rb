class SetTime
  attr_reader :min1, :sec1

  def initialize
    time1 = Time.now
    @min1 = (time1.hour + 1)
    if time1.min < 10
      @sec1 = "0" + time1.min.to_s
    else
      @sec1 = time1.min
    end
  end
end
