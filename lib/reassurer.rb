# Receives instruction from the interface to send
# a text message to the customer, and sends that
# message on to the API
class Reassurer
  def initialize
    @time = (Time.now + 3600).strftime("%H:%M:%S")
  end

  def reassure
    "Thank you! Your order was placed and will be delivered before #{time}"
  end

  private

  attr_reader :time
end
