require 'twilio-ruby'
class Notifier
  def initialize(config_loader_klass:)
    config_loader = config_loader_klass.new('./support/config.yaml')
    account_sid = config_loader.account_sid
    auth_token = config_loader.auth_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
  def notify(estimated_time)
    time = "#{estimated_time.hour}:#{estimated_time.min}"
    body = "Thank you! Your order was placed and will be delivered before #{time}"
    @client.messages.create(from: '+447481341019',
                            to: '+442032907677',
                            body: body)
  end
end
