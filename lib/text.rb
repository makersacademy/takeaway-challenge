require 'twilio'

class Text
  attr_reader :body, :expected_time

  def initialize(body = "test", expected_time = "9:30\"", twilio = Twilio.new)
    @body = body
    @expected_time = expected_time
    @twilio = twilio
  end

  def send_message
    puts "#{body} #{expected_time}"
    @twilio.send_message("#{body} #{expected_time}")
  end
end
