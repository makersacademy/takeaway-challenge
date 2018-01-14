require('bundler')


class ConfirmationText

  def send
    account_sid = 'AC320c190caa5ccbfabb4ab97ad5d30f48'
    auth_token = ENV['MY_KEY']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create({
      :from => '+441522246259',
      :to => ENV['MY_NO'],
      :body => "Thank you for your order! Your delivery will be with you whenever we find it",
      })
  end

end
