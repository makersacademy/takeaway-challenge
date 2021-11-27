# # Download the helper library from https://www.twilio.com/docs/ruby/install
# require 'rubygems'
# require 'twilio-ruby'

# # Find your Account SID and Auth Token at twilio.com/console
# # and set the environment variables. See http://twil.io/secure
# account_sid = ENV['TWILIO_ACCOUNT_SID']
# auth_token = ENV['TWILIO_AUTH_TOKEN']
# @client = Twilio::REST::Client.new(account_sid, auth_token)

# message = @client.messages
#   .create(
#      body: 'This is the ship that made the Kessel Run in fourteen parsecs?',
#      from: '+15017122661',
#      media_url: ['https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg'],
#      to: '+15558675310'
#    )

# puts message.sid
# EXAMPLE JSON RESPONSE
# {
#   "account_sid": "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
#   "api_version": "2010-04-01",
#   "body": "This is the ship that made the Kessel Run in fourteen parsecs?",
#   "date_created": "Thu, 30 Jul 2015 20:12:31 +0000",
#   "date_sent": "Thu, 30 Jul 2015 20:12:33 +0000",
#   "date_updated": "Thu, 30 Jul 2015 20:12:33 +0000",
#   "direction": "outbound-api",
#   "error_code": null,
#   "error_message": null,
#   "from": "+15017122661",
#   "messaging_service_sid": "MGXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
#   "num_media": "0",
#   "num_segments": "1",
#   "price": null,
#   "price_unit": null,
#   "sid": "SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
#   "status": "sent",
#   "subresource_uris": {
#     "media": "/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Media.json"
#   },
#   "to": "+15558675310",
#   "uri": "/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json"
# }