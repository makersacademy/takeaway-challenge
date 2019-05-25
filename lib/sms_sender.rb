require 'twilio-ruby'

class SmsSender
  def initialize(sms_client = Twilio::REST::Client, time = Time)
    @account_sid = ENV.fetch('ACCOUNT_SID')
    @auth_token = ENV.fetch('AUTH_TOKEN')
    @from = ENV.fetch('TWILIO_NUMBER') # Your Twilio number
    @to = ENV.fetch('GEOFFS_NUMBER')
    @client = sms_client.new(@account_sid, @auth_token)
    @time = time.new
  end

  def confirm_order
    @client.messages.create(
      from: @from,
      to: @to,
      body: message_content
    )
  end

  private

  def message_content
    "Thanks for your order. We will aim to have your food delivered by #{@time.hour + 1}:#{@time.min}"
  end
end
