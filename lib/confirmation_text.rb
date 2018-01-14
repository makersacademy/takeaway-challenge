require('twilio-ruby')

class ConfirmationText

  def initialize
    @time = Time.new
    @account_sid = 'AC320c190caa5ccbfabb4ab97ad5d30f48'
    @auth_token = ENV['MY_KEY']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
  end

  def send
    @client.messages.create({
      :from => '+441522246259',
      :to => ENV['MY_NO'],
      :body => "Thank you for your order! Your delivery will be with you at #{@time.hour + 1}:#{@time.min} maybe or maybe not.",
      })
  end

end
