require_relative 'time'

class SMSMessenger
    def send_sms
      "Thank you! Your order was placed and will be delivered before #{times}"
    end
    def times
      clock = Clock.new
      clock.times
    end
end
