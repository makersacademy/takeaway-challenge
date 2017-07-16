require 'twilio-ruby'

class Messager

  TWILIO_NUMBER, CUSTOMER_NUMBER = '', ''

  def initialize
    account_sid = 'AC97143f5ea971f392fcb0875852911f6b'
    auth_token = '665633a5da3552e60650bbaf77b54916'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(message, customer_telephone_no = CUSTOMER_NUMBER)
    @client.messages.create({
      :from => TWILIO_NUMBER,
      :to => customer_telephone_no,
      :body => message,
    })
  end

end
