class Confirmation
  def initialize(time = Time)
    @time = time
  end

  def message
    return "Thank you! Your order was placed and will be delivered before #{one_hour}"
  end

  private

  def one_hour
    (@time.now + 3600).strftime("%H:%M")
  end
end
