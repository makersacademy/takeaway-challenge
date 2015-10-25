
class SendText
  attr_reader :client, :sid, :token, :twilio_number, :client_number

  def initialize
    @sid           = "AC6b7ab63d1f94bf169405bcdc04f92ec7"
    @token         = "0398c4bc1b8e001bdb4f32ac50d6caa9"
    @twilio_number = "441732601093"
    @client_number = "447717161412"
  end


  def send_message(text)
    send_sms(text)
  end

  private

  def send_sms(text)
    @client = Twilio::REST::Client.new @sid, @token
    @client.account.messages.create({
    	:from => @twilio_number,
    	:to => @client_number,
    	:body => text
    })
 end

end
