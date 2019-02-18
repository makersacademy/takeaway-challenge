require 'twilio-ruby'
class Messager

  TAKEAWAY_NAME = 'Woahaca'

  def initialize
    account_sid = 'AC956827740592885b15b02686ac20edd3'
    auth_token = 'b7d7d8b1d713677c785c3c02677241ec'
    @twilio_no = '+441302590246'
    @client_no = '+447702693052'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_confirmation(price)
    delivery_time = (Time.new + 3600).strftime('%H:%M')
    @client.account.messages.create(
    :body => "Thank you for ordering with #{TAKEAWAY_NAME}! Your order total is: £#{price} and will be with you by #{deliver_time}.",
    :to => @client_no,
    :from => @teilio_no)
  end
end
