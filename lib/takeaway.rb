require_relative 'basket'
require_relative 'confirmation_sender_stdout'

class Takeaway
  def initialize(confirmation_sender = ConfirmationSenderStdout, basket = Basket.new)
    @confirmation_sender = confirmation_sender
    @basket = basket
  end

  def menu
    [
      { name: "mixed meze", price: 10 },
      { name: "lahmacun", price: 4 },
      { name: "chicken shish", price: 10 },
      { name: "iskender kebab", price: 12 },
      { name: "icli kofe", price: 12 },
      { name: "baklava", price: 6 }
    ]
  end

  def add_to_order(dish, quantity)
    raise "Cannot add to order: item is not available. "\
          "Select items from the menu." unless menu.include? dish

    quantity.times { @basket.add(dish) }
    @basket
  end

  def basket
    @basket.contents
  end
  
  def verify(price)
    raise "Cannot verify order: the price was wrong. "\
          "Check your maths! 😜" if price != @basket.total

    send_confirmation_message
    true
  end

  private

  attr_reader :confirmation_sender

  def send_confirmation_message
    one_hour_from_now = (Time.new + 3600).strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before #{one_hour_from_now}."
    confirmation_sender.send(message)
  end
end
