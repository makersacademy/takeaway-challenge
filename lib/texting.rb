require 'twilio-ruby'

class Texting

  attr_reader :client
  def initialize(client = Twilio::REST::Client.new(@account_sid, @auth_token))
    @account_sid = 'AC3d03eb178fd596cb1bfb7a2f56088ec8'
    @auth_token = '1df4eb0b7d566a57ab19a6a22fc31ff9'
    @twil_no = '+441992352094'
    @client = client
  end

  def send_text(num, message)
    @client.api.account.messages.create(
      :from => '+441992352094',
      :to => "+#{num}",
      :body => message
    )
  end

end
