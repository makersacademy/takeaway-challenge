require 'twilio-ruby'

class Notifier

	ACCOUNT_SID = ["AC9b75faaa7dc888de8801780784c0639b"]
	AUTH_TOKEN  = "3c23078fac6c0265238b303c7eb4c3c1"

  MESSAGE = "Your order will arrive at {time}"

  attr_accessor :message, :via, :client, :to, :via, :from

  def initialize opts = {}
    @message = opts[ :message ] || 'MESSAGE'
    @from    = opts[ :from    ] || '+441622523155'
    @to      = opts[ :to      ] || '+4407761960879'
    @via     = opts[ :via     ] || Twilio::REST::Client.new( ACCOUNT_SID, AUTH_TOKEN )
  end

  def self.call( *args )
      new(*args).send_message  
  end

  def send_message 
    via.account.messages.create( {
      
                            from: from,
                            to:   to,
                            body: message
    } ) 
  end

  private

  def time
    ( Time.now + 3600 ).strftime "%R"
  end

end