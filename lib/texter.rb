require 'twilio-ruby'

class Texter

	attr_reader :processed_orders

	def initialize(client=Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'],ENV['TWILIO_AUTH_TOKEN']))
		@client = client
	end

	def send_confirmation(time=Time.now)
		@client.account.messages.create(
			from: ENV['TWILIO_FROM'], 
			to: ENV['TWILIO_TO'],
			body: "Thank you! Your order was placed successfully and will be delivered by #{time_calc(time)}")
	end

	def check_for_orders(establishment)
		@client.account.messages.list(to: ENV['TWILIO_FROM']).each do |message|
			if message.body != ""
				order = message.body
				message.redact
				establishment.place_order(total:extract_total(order),order:extract_order(order))
			end
		end
	end

	private
	
	def time_calc(time)
		(time+(60*60)).strftime("%H:%M")
	end

	def extract_total(message)
		message[/([Tt]otal)(:)([0-9.]+)/,3].to_i
	end

	def extract_order(message)
		order_hash = {}
		message.gsub(/[Tt]otal:[0-9.]+[, ]+/,'').split(',').each do |order|
			item = order[/[a-zA-Z][a-zA-Z0-9 _]+/].to_sym
			quant = order[/(:)([0-9]+)/,2].to_i
			order_hash[item]=quant
		end
		order_hash
	end

end