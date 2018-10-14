require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby' # put your own credentials here
require_relative 'takeaway'

class Basket

  attr_reader :list
  attr_accessor :takeaway

  def initialize
    @list = []
  end

  account_sid = '<AccountSid>'
  auth_token = '<AuthToken>'

  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
   :to => '<ToNumber>',
   :from => '<FromNumber>',
   :body => '<BodyText>',
  })
end
