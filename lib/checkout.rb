require 'twilio-ruby' 
 
# put your own credentials here 
account_sid = 'ACb33f4fd0aff5c7fda8281e6869974440' 
auth_token = '51c5fd32f133774decb77521d9469814' 
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.messages.create({ 
	from: '+441803503017',
	to: '+447809148347',   
	body: 'Hello Jono from Grahams awesome code'
})


# FRIENDLY NAME
# makers-takeaway
# SID
# SK2ae0b1d7cc6fa792991f303da8561721
# SECRET
# hhtPFyjH1VUiUFHZh6hDreTkV0O0WS3A