require_relative 'order'
require 'twilio-ruby'

class TakeAway

  attr_reader :order, :client, :time

  def initialize
    @order = nil
    @time = nil
    account_sid = 'ACa206311f1db3aa3e89266428028502e6'
    auth_token = '6d2281959a637956390e1c470772fb57'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def place(order)
    self.order = order
    self.time = Time.new
    message = "Your order will be delivered by #{time + (60*60)}"
    send_text(message)
  end

  private
attr_writer :order, :client, :time

def send_text(message)
  self.client.account.messages.create(
    from: '+441274288495',
    to: "+44#{7443191545}",
    body: message
  )
end

end
