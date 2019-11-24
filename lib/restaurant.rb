class Restaurant
  DELIVERY_TIME = 3600 # one hour

  attr_reader :takeaway, :text_provider

  def initialize(takeaway = Takeaway.new, text_provider = TextProvider.new)
    @takeaway = takeaway
    @text_provider = text_provider
  end

  def checkout(price)
    fail "The takeaway basket is empty" if @takeaway.empty?
    fail "Payment amount not correct" unless @takeaway.correct_amount?(price)

    @text_provider.send_text(delivery_time)
    @takeaway.complete
  end

  private

  def delivery_time
    (Time.now + DELIVERY_TIME).strftime("%k:%M")
  end
end
