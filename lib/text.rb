require 'twilio-ruby'
module Text
  def send_text
    account_sid = 'AC30dc5b990ed47dc40d92963328691a89'
    auth_token = '3836dc07ae8ad1dcb7013deffa80468c'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
    :from => '+44 1677 252017',
    :to => '+44 7730474548',
    :body => 'Thank you! Your order was placed and will be delivered in one hour.',
    )
  end
end
