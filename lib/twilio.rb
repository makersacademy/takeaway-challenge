require 'twilio-ruby'

class Twilio_sms

  def initialize(dishes, total)
    @dishes = dishes
    @total = total
  end

  def send_text_message

    account_sid= ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.sms.messages.create(
      :from => ENV['TWILIO_NUM'],
      :to => ENV['MY_NUM'],
      :body => "Thank you! Your order is #{@dishes} with a total of #{@total}! Your order was placed and will be delivered before 18:52."
    )
  end
end
