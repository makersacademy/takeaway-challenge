require 'twilio-ruby' 

class Messager

  def send_message(txt_message) 
    config
    @client.account.messages.create({
      :from => '+441143032569', 
      :to => '+447832366992', 
      :body => txt_message,
    })
  end  
  
  private
  def config
    account_sid = 'ACa742df3682aa80d6d524a052cf5b0013'            # My credentials are saved as environment variables.    
    auth_token = '7ec72cd5e7e018b5cc0b292a154210ba'               # My credentials are saved as environment variables.      
    @client = Twilio::REST::Client.new account_sid, auth_token    # Client to talk to the Twilio REST API 
  end
  
  #The environment variables ENV["TWILIO_ACCOUNT_SID"] and ENV['TWILIO_AUTH_TOKEN'] that I set up did not work.

end