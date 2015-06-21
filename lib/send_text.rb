class Send_Text 
 
 attr_reader :message, :sender, :receiver

 def initialize(message:, from:,to: )
  @message = message
  @sender = from 
  @receiver = to 
end 

 def text 
@client.account.messages.create({
  :from => sender.number, 
  :to => receiver.number, 
  :body => 'Hello '})

end 

end 