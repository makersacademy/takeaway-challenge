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
    account_sid = 'ACa742df3682aa80d6d524a052cf5b0013'         
    auth_token = '7ec72cd5e7e018b5cc0b292a154210ba'               # My credentials  
    @client = Twilio::REST::Client.new account_sid, auth_token    # Client to talk to the Twilio REST API 
  end

end