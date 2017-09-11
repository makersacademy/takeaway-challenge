require 'twilio-ruby'
require_relative 'order'

class TextConfirm

  def text_confirmation
    return 'your order is on the way!'
    # account_sid = "AC0de1208f7ea73d489b41ecda8c5ed54f"
    # auth_token = "55fba7009608465f493b4395eb00c633"
    #
    # @client = Twilio::REST::Client.new account_sid, auth_token
    # message = @client.messages.create(
    #     body: "Thank you! Your MAKERS EXPRESS order'll be there before #{(Time.now + (60 * 60)).strftime("%H:%M:%S")}",
    #     to: "************",
    #     from: "+441902504480")
    #
    #     puts message.sid
  end

end
