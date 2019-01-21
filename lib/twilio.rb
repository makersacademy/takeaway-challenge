require 'rubygems'
require 'twilio-ruby'

class Sendsms

  def send_message(body)

    account_sid = 'AC69cef69991d1c8e42e3bfff281157e71'
    auth_token = 'ec63982659c577e36ee530ea9e604093'
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
                             from: 'Your twilio number e.g +441922214593',
                             body: body,
                             to: 'Your personal number e.g. +447446966284'
                           )

                           puts message.sid
                         end
end
