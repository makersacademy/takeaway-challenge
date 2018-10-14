class ConfirmationMessage

  def initialize(delivery_time = nil)
    @delivery_time = delivery_time.nil? ? 
      ((Time.new + 60 * 60).strftime "%H:%M") : delivery_time
  end

  def text
    "Thank you! Your order was placed and will" \
    " be delivered before #{@delivery_time}"
  end

end
