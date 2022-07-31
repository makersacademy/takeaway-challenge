require 'dotenv/load'
require 'twilio-ruby'

class Text

  def initialize
    @client = Twilio::REST::Client.new ENV['SID'], ENV['TOKEN']
  end

  #https://www.rubydoc.info/gems/twilio-ruby/Twilio/REST/RestError#status_code-instance_method
  def send(body_message)
    begin
      send_text(body_message)
      return {:code => "200", :error => "success"}
    rescue Twilio::REST::TwilioError => e
      return {:code => e.status_code.to_s, :error => e.error_message}
    end
  end

  def send_text(body)
    @client.messages.create( body: body,  messaging_service_sid: ENV['MESSAGEID'], to: ENV['MYNUM'])
  end

end

