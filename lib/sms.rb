class SMS
  # repeating myself, consider a class for from/to perhaps?
  attr_reader :to, :from, :message

  def initialize(sms_provider, from, to, message)
    @sms_provider = sms_provider
    @from = from
    @to = to
    @message = message
  end

  def send
    @sms_provider.send_sms(@from, @to, @message)
  end

end
