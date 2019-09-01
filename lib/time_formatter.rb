class TimeFormatter
  def initialize(format = '%H:%M')
    @format = format
  end

  def format(time)
    time.strftime @format
  end
end