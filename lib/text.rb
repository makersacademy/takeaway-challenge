require_relative 'order.rb'

class Text

  def send_text
    time = Time.new
    later_time = Time.now + 1 * 60 * 60
    message = "Thank you for your order. It will be delivered at #{later_time.hour}:#{time.min}"
  end
end