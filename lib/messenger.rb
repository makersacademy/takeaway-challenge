#sends message to customer
require 'twilio-ruby'


# class Messenger
#
#   account_sid = "{{ aAC30b9000efac4bc5220d635af980a7564 }}"
#   auth_token = "{{ 8f9a5ba6f0a69b3e911942a76aeef4d5 }}"
#
#   @client = Twilio::REST::Client.new account_sid, auth_token
#
#   @client.messages.create(
#   from: '+447545253288',
#   to: '+447545253288',
#   body: 'Hey there!'
# )

  def send
    p "order confirmed, expected deliver in one hour. Thank you."
  end


end
