class Phone

  def initialize
    @account_sid = 'AC743acc5594ff64f05dc907422f204b4d'
    @auth_token = '63741f91cb6b9143d0d1ba70e6fef95e'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_confirmation
    from = '+441173252750'
    to = '+447923174752'
    h = Time.now.strftime('%H').to_i + 1
    m = Time.now.strftime('%M').to_i
    body = "Your order will be placed at #{h}:#{m}"
    @client.api.account.messages.create(
      from: from,
      to: to, 
      body: body
    )
  end
end