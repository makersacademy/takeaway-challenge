require 'twilio-ruby'
class SMS
  def initialize(config, client: nil)
    @client = client || Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
    @config = config
  end

  def deliver_sms
    # needs to inser message here
  end
end