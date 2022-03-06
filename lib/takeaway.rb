class Takeaway
  def initialize(twilio_manager)
    @twilio_manager = twilio_manager
  end

  def send_confirmation_text
    @twilio_manager.send_sms(confirmation_string)
  end
  
  private
  
  def confirmation_string
    "Thank you! Your order was placed and will be delivered before #{time_in_an_hour}"
  end

  def time_in_an_hour
    current_time = Time.new
    "#{current_time.hour + 1}:#{current_time.min}"
  end
end