require 'rubygems'
class Sms_Text

	def send_text
		account_sid = 'AC1cffe35eb134133af61d8ab716f40588'
		auth_token = '48e47a677c14dd9162f479523ed7fb3c'

		@client = Twilio::REST::Client.new account_sid, auth_token

		@client.account.messages.create({
		:from => '+442033225791',
		:to => '+4477837673624',
		body: "Your order has been accepted!  #{view_current_order} will arrive by #{(Time.now+3600).strftime('%H:%M')}"
		})
  end

end
