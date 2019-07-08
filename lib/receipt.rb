require 'twilio-ruby'
require 'rubygems'
require_relative  '/Users/student/Projects/admin/takeaway_details/details.rb'

class Receipt

  def initialize

    account_sid = Numbers::ACCOUNT_SID
    auth_token = Numbers::AUTH_TOKEN

    @client = Twilio::REST::Client.new(account_sid, auth_token)

  end

  def confirmation(order, num = Numbers::MY_NUM, twil = Numbers::TWIL_NUM)
    @client.messages.create(
      to: num,
      from: twil,
      body: order
    )
    order

  end
end
