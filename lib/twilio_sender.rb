require 'twilio-ruby'  # => true

class Twilio_Sender

  attr_reader :from, :client, :account_sid, :auth_token  # => nil

  def initialize
    @from = "441767512027"                                        # => "441767512027"
    @account_sid = 'AC60f704b617eb4d0f74dec894d219dcf3'           # => "AC60f704b617eb4d0f74dec894d219dcf3"
    @auth_token = 'c8757446a92df4de724fccdae07b7299'              # => "c8757446a92df4de724fccdae07b7299"
    @client = Twilio::REST::Client.new @account_sid, @auth_token  # => <Twilio::REST::Client @account_sid=AC60f704b617eb4d0f74dec894d219dcf3>
  end

  def send_text to, message
    message = @client.account.messages.create(:body => message,  # => "test"
        :to => to,     # Replace with your phone number
        :from => @from,                                          # => "441767512027"
        :via => @client)   # Replace with your Twilio number
  end

end
