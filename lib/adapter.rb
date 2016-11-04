# require "twilio-ruby"
#
# class Adapter
#   def send_sms(message)
#     client = Twilio::REST::Client.new["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
#     twilio_number = ENV["TWILIO_NUMBER"]
#     phone_number = ENV["TEST_NUMBER"]
#     outgoing = client.account.messages.create(
#     from: twilio_number,
#     to:  phone_number,
#     body: message,
#     )
#   end
#
#   def get_inbound_messages
#     client = Twilio:REST::Client.new sid, token
#     inbound = []
#     messages = client.account.messages.list
#     messages.each do |message|
#       inbound << [message.from, message.body]
#     end
#     inbound.select{ |f,m| != ENV['TWILIO_NUMBER']}
#   end
#
#   def update_messages
#     client = Twilio::REST::Client.new sid, token
#     to_delete = []
#     messages = client.account.messages.list
#     messages.each{|message| to_delete << message.sid}
#     to_delete.each do |sid|
#       message = client.account.messages.get(sid)
#       message.redact()
#     end
#   end
#
#   private
#
#   attr_reader :sid, :token, :twilio_number, :phone_numberend
# end
