class Phone

  def initialize
    #environment variables used for twilSID and twiltoken
    account_sid = 'twilsid'
    auth_token = 'twiltok'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from = '+441173252750'
    @to = '+447923174752'
  end

  def send_confirmation
    h = Time.now.strftime('%H').to_i + 1
    m = Time.now.strftime('%M').to_i
    body = "Your order will be delivered before #{h}:#{m}"
    @client.api.account.messages.create(
      from: @from,
      to: @to, 
      body: body
    )
  end
end