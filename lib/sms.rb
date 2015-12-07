class Sms

  def initialize
    @tokens = YAML::load(File.open('./lib/resources/tokens.yml'))
  end

   def send(delivery_time)
     @tokens = YAML::load(File.open('./lib/resources/tokens.yml'))
     client = Twilio::REST::Client.new @tokens["account_sid"], @tokens["auth_token"]
     client.account.messages.create(
     :from => @tokens["from_number"],
     :to => @tokens["to_number"],
     :body => "Order placed! It will arrive by #{delivery_time}." )
   end

end
