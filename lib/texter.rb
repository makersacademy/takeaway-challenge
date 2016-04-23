class Texter

	def initialize(client=Twilio::REST::Client.new("AC59d366eb0b90cb69be3545ee98da417f","a8c82c2f64ffc1960e07b8ede2744c59"))
		@client = client
	end

	def send_confirmation
		@client.account.messages.create(
			from: "+441277424334", 
			to: "+447921046417", 
			body: "Thank you! Your order was placed successfully and will be delivered an hour from #{Time.now}")
	end

end