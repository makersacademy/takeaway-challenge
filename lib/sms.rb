class SMS

  attr_reader :sent

  def initialize
    @sent = false
  end

  def send_sms
    @sent = true
  end
  #do I need sent? AND the sent attr_reader???
  def sent?
    @sent
  end

  def sms_sent_confirmation
    "A confirmation message has been sent to the number you provided"
  end
end
