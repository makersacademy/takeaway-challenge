class Text
  ACC_SID = 'ACeeb78433dcba23619b98cde03e52ad52'
  AUTH_TOKEN = 'a94d23d1ddf68e710fc6a823c7e50380'
  CLIENT = Twilio::REST::Client.new(ACC_SID, AUTH_TOKEN)
  FROM = '+441202286113'
  TO = '+447982787204'
  HOUR = 3600

  def initialize
    @time = Time.now + HOUR
  end

  def send
    CLIENT.messages.create(from: FROM, to: TO, body: create_body)
    "Thanks! Look out for a confirmation text."
  end

  def create_body
    "Thanks for your order! It will be delivered by #{@time.strftime("%H:%M")}."
  end
end
