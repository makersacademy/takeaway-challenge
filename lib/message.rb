class Message
 # < ActiveRecord::Base

	# def checkout
	# 	@twillio_number = ENV['+441499377050']
	# 	@client = Twilio::REST::Client.new ENV['ACcfe825bed98b787a84ccf44cd2201d3d'], ENV['b8a10b37854527e41470c031258077d8']
	# 	message = @client.account.messages.create(
	# 	  from: '+441499377050',
	# 	  to: '+447414782578',
	# 	  body: 'Thanks you for your order, your items shall be delivered within 1 hour!'
	# 	)
	# 	puts message.to
	# end
 
require 'twilio-ruby'

@account_sid = ACcfe825bed98b787a84ccf44cd2201d3d
@auth_token = b8a10b37854527e41470c031258077d8

@client = Twilio::REST::Client.new(@account_sid, @auth_token)

	def text
		@account.messages.create(
		  from: '+441499377050',
			  to: '+447414782578',
			  body: 'Thanks you for your order, your items shall be delivered within 1 hour!'
		)
	end

end