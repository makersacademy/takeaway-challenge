# require_relative 'twilio-ruby'
# require_relative 'order'

class Delivery

  # def initialize
  #   account_sid = "AC1f92a5b3d10fa61a14ef3256b404b059"
  #   auth_token = "{{ 0be04ec9c867f8fcd1e916761508e2fb }}"
  #   @client = Twilio::REST::Client.new account_sid, auth_token
  # end
  #
  # def delivery_text
  #   message = @client.account.messages.create(:body => "Hello your delivery is on it's way",
  #   :to => "+07732425586",
  #   :from => "+441289466048")
  #   puts message.sid
  # end

  def delivery_time
    t = Time.now + 1*60*60
  end
  
end
