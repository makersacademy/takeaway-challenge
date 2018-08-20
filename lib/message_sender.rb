require 'twilio-ruby'

module Message_sender

  def send_message(message)
    # To find these visit https://www.twilio.com/user/account
    account_sid = "AC5bc426421c17af3f13cf2f44ca8e7ccf"
    auth_token = "25a60b262c7a3df165b78e8c8e80ab3b"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+447725799311",
      from: "+447480485261",
      body: message
    )
  end
end


# curl 'https://api.twilio.com/2010-04-01/Accounts/AC5bc426421c17af3f13cf2f44ca8e7ccf/Messages.json' -X POST \
# --data-urlencode 'To=+447725799311' \
# --data-urlencode 'From=+447480485261' \
# --data-urlencode 'Body=Example text' \
# -u AC5bc426421c17af3f13cf2f44ca8e7ccf:[AuthToken]