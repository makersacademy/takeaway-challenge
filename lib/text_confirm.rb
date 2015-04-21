class TextConfirm
  def send_order twilio, what
    @client = twilio.new
    p @client
    @client.account what
    # @client.account.messages.create(what)
  end
end