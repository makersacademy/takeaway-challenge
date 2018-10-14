class Text
  CLIENT = Twilio::REST::Client.new(ENV['ACC_SID'], ENV['AUTH_TOKEN'])
  HOUR = 3600

  def initialize
    @time = Time.now + HOUR
  end

  def send
    CLIENT.messages.create(from: ENV['FROM'], to: ENV['TO'], body: create_body)
    "Thanks! Look out for a confirmation text."
  end

  def create_body
    "Thanks for your order! It will be delivered by #{@time.strftime("%H:%M")}."
  end
end
