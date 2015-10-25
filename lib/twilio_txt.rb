require "twilio-ruby"

class Sms
  attr_reader :num
  def initialize(client=false, frm=ENV["twilioFRM"])
    @from = frm
    @sid = ENV["twilioSID"]
    @tok = ENV["twilioTOK"]
    @client = client ? client : Twilio::REST::Client.new(@sid, @tok)
  end

  def call(num="no_num", message="DOOM POTATO")
    @num = (num == "no_num" ? "+447479365828" : num)
    @client.account.messages.create(from: @from, to: @num, body: message)
    "ORDER PLACED: #{message}"
  end
end
