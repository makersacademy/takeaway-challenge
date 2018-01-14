

class SMS
  # attr_reader :client

  def initiliaze(config, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
  end

  def delivered
  end

end
