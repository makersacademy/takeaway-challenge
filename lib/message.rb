require 'dotenv/load'

class Message

  def send_text
    "Message sent"
  end

  def create
    delivery_window = 60*60 # 60*60 seconds = 1 hour
    delivery_time = Time.now + delivery_window
    arrival_time = "#{delivery_time.strftime('%H')}:#{delivery_time.strftime('%M')}"
    "Thank you! Your order was placed and will be delivered before #{arrival_time}"
  end
end
