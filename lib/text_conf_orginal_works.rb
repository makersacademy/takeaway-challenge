require 'twilio-ruby' 
# class TextConfirm
#   def send_order twilio, order
#     @client = twilio.new
#     p @client
#     t = Time.new
#     t += 3600
#     str = " order ready at #{t.strftime("%H:%M")}"
#     message = order.to_s + str
#     @client.account.messages.create message
#   end
# end

# should take an argument and send that to twilio
class TextConfirm
  def format_order order
    t = Time.new
    t += 3600
    out_put = order.to_s + " expect delivery at #{t.strftime("%H:%M")}" 
    @hash = {
      :from => '+441315104519', 
      :to => '+447852129554',
      :body => out_put
    }
    @hash
  end

  def send_order
    account_sid = 'AC947047475abd8b284f04d067e3876b92' 
    auth_token = 'adb480ce3dd0ac18368a17d7c97496e3' 
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(@hash)
  end

end