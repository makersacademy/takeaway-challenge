require 'twilio-ruby'

class SMSHandler

  def send_confirmation(message)
    info = read_info
    @client = Twilio::REST::Client.new(info[0], info[1])
    message = @client.messages.create(
      body: message,
      to: info[2],
      from: info[3])
    puts message.sid
  end

  private
  def read_info
    read_string = File.read 'Twilio_info.txt'
    read_string.split(',')
  end
end
