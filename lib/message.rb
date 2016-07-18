# require 'twilio-ruby'
#
#
# class Message
#
#   def send_confirmation
#
#      account_sid = '<AC71091e45b8b259664e487539658c839d>'
#      auth_token = '<252d0d6447352f65aacd42e6870395bb>'
#
#      # set up a client to talk to the Twilio REST API
#      @client = Twilio::REST::Client.new account_sid, auth_token
#
#      @client.account.messages.create({
#          :to => '07756685861>',
#          :from => '<441631402037>',
#          :body => "Thank you! Your order was placed and will be delivered before #{((Time.new.hour) + 1)}:#{Time.new.min}"
#      })
#
#   end
# end
