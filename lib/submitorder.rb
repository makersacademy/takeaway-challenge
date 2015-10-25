require './lib/sendtext'

class SubmitOrder

  attr_reader :client
  attr_accessor :order

  def initialize sendtext_klass, account_sid, auth_token
    @client = sendtext_klass.new account_sid,auth_token

  end


end