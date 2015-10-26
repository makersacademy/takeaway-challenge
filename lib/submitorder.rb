require './lib/sendtext'

class SubmitOrder

  attr_reader :client, :total
  attr_accessor :order

  def initialize sendtext_klass=Sendtext, account_sid, auth_token
    @client = sendtext_klass.new account_sid,auth_token
  end

  def get order,total
    self.order = order
    @total = total
  end

  def validated?
    total == order.total
  end

  def submit message
    if validated?
      client.send_message = message
      "Order OK and sent expect a text message confirmation"
    else
      "Order total incorrect"
    end
  end



end