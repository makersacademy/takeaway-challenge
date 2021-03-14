class TextMessage

  def initialize(client = Twilio::REST::Client)
    @account_sid = 'ACe31e16fc905826f7652afa8c333ab118'
    @auth_token = '922cbf78f2d2433fe970a916ee333ac9'
    @client = client.new(@account_sid, @auth_token)
    @from = '+18638771182'
  end

  def send_text_message(to)
    instance = @client
    instance.messages.create(
    from: @from,
    to: to,
    body: "Thank you! Your order has been placed and will be delivered before #{(Time.now + 1*60*60).strftime("%R")}"
    )
  end

end
