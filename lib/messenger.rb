# require 'rubygems'
# require 'twilio-ruby'

class Messenger
  def send_text
    future_time = Time.now + 3600
    account_sid = 'ACa853e1ef5346864a0d7d654da29a382c'
    auth_token = '2ff50b24738e8fd05f6f5f9ce7602323'
    begin
      @client = Twilio::REST::Client.new account_sid, auth_token
      @client.account.messages.create({
        :from => '+441923750654',
        :to => '+447740779375',
        :body => "Thanks! Your order has been placed, and it will be with you by #{future_time.strftime("%H:%M")}"})
      rescue Twilio::REST::RequestError => e
        puts e.message
    end
  end
end
