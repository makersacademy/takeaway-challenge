require 'twilio-ruby'
require 'time'

class Message

  attr_reader :time

  def initialize
    @time = Time.now + 1*60*60
    @time = @time.strftime("%k:%M")
  end

end
