require 'twilio-ruby'

class Texter

	attr_reader :processed_orders

	def initialize(client=Twilio::REST::Client.new("AC59d366eb0b90cb69be3545ee98da417f","a8c82c2f64ffc1960e07b8ede2744c59"))
		@client = client
	end

	def send_confirmation(time=Time.now)
		@client.account.messages.create(
			from: "+441277424334", 
			to: "+447921046417", 
			body: "Thank you! Your order was placed successfully and will be delivered by #{time_calc(time)}")
	end

	def check_for_orders(establishment)
		@client.account.messages.list(to: '+441277424334').each do |message|
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