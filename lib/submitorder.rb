require './lib/sendtext'

class SubmitOrder

  attr_reader :client, :total
  attr_accessor :order

  def initialize sendtext_klass, account_sid, auth_token
    @client = sendtext_klass.new account_sid,auth_token
  end

  def get order,total
    self.order = order
    @total = total
  end

  def validated?
    total == order.total
  end

  def submit mobilenumber
    if validated?
      client.send_message = "Thank you! Your order was placed and will be delivered before 18:52"
      "Order OK and sent expect a text message confirmation"
    else
      "Order total incorrect"
    end
  end



end