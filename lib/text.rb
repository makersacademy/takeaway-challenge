require 'twilio-ruby'
require 'yaml'

module Text
  def self.init
    @config = YAML::load_file('../config.yml')
    @client = create_client(@config['creds']['account_sid'], @config['creds']['auth_token'])
  end

  def self.create_client(account_sid, auth_token)
    Twilio::REST::Client.new account_sid, auth_token
  end

  def self.send_text(text)
    @client.api.account.messages.create({
      :from => @config['from'],
      :to => @config['to'],
      :body => text,
    })
  end
end
