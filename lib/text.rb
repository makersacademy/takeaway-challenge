require 'twilio'

class Text
  attr_reader :body, :expected_time
  EMPTY_FIELDS = "cannot send, empty fields in message".freeze

  def initialize(body = "test", expected_time = "9:30\"", twilio = Twilio.new)
    @body = body
    @expected_time = expected_time
    @twilio = twilio
  end

  def unable_to_send?
    @body.empty? || expected_time.empty?
  end

  def send_message
    raise EMPTY_FIELDS if unable_to_send?
    @twilio.send_message("#{body} #{expected_time}")
  end
end
