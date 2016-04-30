require 'rubygems'
require 'twilio-ruby'


class Confirmation

  def initialize(phone_number)
    @account_sid = "AC195e376d56f18ac7d3ed5ca4b7c34c91"
    @auth_token = "baf8789ae86bff0c9f44bbd73d88c6b9"
    @client = Twilio::REST::Client.new @account_sid, @auth_token

    @from = "+441143031162"
    @phone_number = phone_number
  end

  def send
    t = (Time.new + (60 * 60)).strftime("%H:%M")
    @client.account.messages.create(:from => @from, :to => @phone_number, :body => "Order confirmed!")
  end

  # "Order confirmed for customer #{@phone_number}! Due to arrive by #{ t }"
end