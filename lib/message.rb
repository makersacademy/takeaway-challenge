require 'twilio-ruby'

class Message

  def complete_order(total_price)
    send_text("Thank you for your order: £#{total_price}. Expect your food by #{delivery_time} ")
  end

  def send_text(message)
  	account_sid = 'ACa4cf08b22ebab768c156ad454eaccb71' 
	  auth_token = '3321406ad1dfa603ec0195d363a5fbef' 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create({
			:from => '+441625800296', 
			:to => "+447817019706", 
			:body => "#{message}",  
		})
	end

	def delivery_time
		(Time.now + 60*60).strftime("%H:%M")
  end

end