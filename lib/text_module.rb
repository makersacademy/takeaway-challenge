require 'twilio-ruby'

module Text

  def text_confirmation(body)
    setup
    @client.messages.create(
    from: '+441503505018',
    to: '+447450946912',
    body: body
    )
  end

  private

  def setup
    set_sid
    set_token
    set_client
  end

  def set_client
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def set_sid
    @account_sid = "ACb317af848af7853745abacca58a4aa95"
  end

  def set_token
    @auth_token = "6ddd28b7dafddf0cdc366f38589dbca0"
  end

end
