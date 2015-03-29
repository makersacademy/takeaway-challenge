class DeliveryInformation
  attr_reader :sent_sms
  def initialize
    @sent_sms = false
  end

  def client_pays
    # use twilio gem to send SMS, but I'll do that later
    if @sent_sms == true
      fail 'SMS was already sent'
    else
      @sent_sms = true
    end
  end
end