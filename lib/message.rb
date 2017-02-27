require 'twilio-ruby'

class Message

  def initialize
    @accountSID = 'ACd46c2d4277327ad9014d8e9b3a16a9b9'
    @authToken = '5a9ab4edfcba1c5f111a502df2312228'
    @client = Twilio::REST::Client.new @accountSID, @authToken
    @from = '+441315103569'
    @customer = { '+447595939340' => "Albert Yanit" }
  end

  def txt_confirmation
    @customer.each do |key, value|
      @client.account.messages.create(
                                      :from => @from,
                                      :to => key,
                                      :body => "Thank you! Your order was placed and will be delivered before #{delivery_time}"
      )
      print "Sent message to #{value}"
    end
  end

  private

  def delivery_time
    t = Time.now + 3600
    t.strftime("%I:%M%p")
  end
end
