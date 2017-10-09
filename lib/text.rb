require 'twilio-ruby'
require 'yaml'

module Text
  def self.init
    create_client
  end

  def create_client
    secret = YAML::load_file('../secret.yml')
    account_sid = secret['creds']['account_sid']
    auth_token = secret['creds']['auth_token']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def self.text_send(price)
    @client.api.account.messages.create({
      :from => '+441575730011',
      :to => '+447590432979',
      :body => "Thank you! Your order was placed and will be delivered before 18:52. Total will be £#{price}",
    })
  end
end


