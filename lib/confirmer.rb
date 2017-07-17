require 'dotenv/load'
require 'twilio-ruby'

class Confirmer

  attr_accessor :items, :cost

  def initialize(items)
    @items = items
    @cost = 0
  end

  def display_order
    items.each { |(k, v)| print "#{v} x #{k}\n" }
  end

  def confirm_order
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      :from => '+441277424078',
      :to => '+447787564620',
      :body => "You ordered: #{items.each { |(k,v)| print "#{v} x #{k}\n" }}\n Your order will arrive at around #{(Time.now + 60 * 60).strftime("%H:%M")}."
    )
  end
end
