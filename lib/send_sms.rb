require 'twilio-ruby'

account_sid = "{{ AC05de05fc0ea265d82ee93c7ab963d77f }}" # Your Account SID from www.twilio.com/console
auth_token = "{{ 608f2952ed29790f899303356dd4b20e }}"   # Your Auth Token from www.twilio.com/console

begin
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
    :body => "Hi, I'm testing out sending messages using Twilio through Ruby",
    :to => "+447776011111",    # Replace with your phone number
    :from => "+441725762045"  # Replace with your Twilio number
    )
rescue Twilio::REST::RequestError => e
  puts e.message
end


# emergency code to access the account:
# oBmTYxKYv4MWm9yflKNxE55kNZUelTZAAtpKB78l
