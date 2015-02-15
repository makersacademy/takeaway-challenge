require 'twilio-ruby'

class Texter

  attr_reader :client

  def initialize
    account_sid = "ACaec4d28c46b3cad3b94eb351ea3231d5"
    auth_token = "04c7f3d58a93daca72f3b40bb132f310"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end