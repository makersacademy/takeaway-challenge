require 'twilio-ruby'

class Sms

  def initialize(client=false, frm=ENV['twilioFRM'])
    @from = frm
    @sid = ENV['twilioSID']
    @tok = ENV['twilioTOK']
    @client = client ? client : Twilio::REST::Client.new(@sid, @tok)
  end

  def call(num='+447479365828', message='DOOM POTATO')
    @client.account.messages.create(from: @from, to: num, body: message)
  end
end

# a = Sms.new
# a.call
