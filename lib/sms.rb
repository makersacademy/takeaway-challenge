require 'twilio-ruby'

class Sms



  def initialize(client_klass = Twilio::REST::Client)
    @client_klass = client_klass
    @client = get_client

    @from = +441740582013
    @to = +447753459230
  end

  def send(msg)
    from = "+441740582013"
    to = "+447753459230"
    @client.account.messages.create(
          :from => from,
          :to => to,
          :body => msg)
  end

  private

  attr_reader :from
  attr_reader :to

  def get_client
    account_sid = "AC466c0233268a94d27d7b5751937e3168"
    auth_token = "9d8cbb995fe1b8fa3c796334cbe04a0f"
    @client_klass.new account_sid, auth_token
  end

end
