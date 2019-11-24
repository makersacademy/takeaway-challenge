class Restaurant
  attr_reader :takeaway, :text_provider

  def initialize(takeaway = Takeaway.new, text_provider = TextProvider.new)
    @takeaway = takeaway
    @text_provider = text_provider
  end

  def checkout(price)
    message = "The given amount does not match the total of the takeaway order"
    fail message unless @takeaway.correct_amount?(price)

    @text_provider.send_message
  end
end
