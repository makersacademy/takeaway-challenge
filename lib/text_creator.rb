require 'time'
class TextCreator
  def initialize(time = Time.now)
    @time = time
  end

  def time_limit
    "#{@time.hour + 1}:#{@time.min}"
  end

  def text
    "Thank you! Your order was placed and will be delivered before #{time_limit}"
  end
end
