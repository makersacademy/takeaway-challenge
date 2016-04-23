require 'twilio-ruby'

class SMS

  TIME_FORMAT = "%H:%M"

  def initialize(config, client: nil)
    @client = client || Twilio::REST::CLIENT.new(config[:account_sid], config[:auth_token])
    @config = config
  end

  def deliver
    client.messages.create(message_args)
  end

  attr_reader :client, :config

  def message_args
    {
      from: config[:from],
      to:   config[:to],
      body: config[:body] % delivery_time
    }
  end

  def delivery_time
      (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end

end


# require 'rubygems' # not necessary with ruby 1.9 but included for completeness
# require 'twilio-ruby'
#
# # put your own credentials here
# account_sid = 'ACbc3cf7bd3b4796396a5d8c3f9f162ccb'
# auth_token = '[AuthToken]'
#
# # set up a client to talk to the Twilio REST API
# @client = Twilio::REST::Client.new account_sid, auth_token
#
# @client.account.calls.create({
# 	:from => '+447813881269',
# 	:method => 'GET',
# 	:fallback_method => 'GET',
# 	:status_callback_method => 'GET',
# 	:record => 'false'
# })
