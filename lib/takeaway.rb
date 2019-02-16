require 'twilio-ruby'

class Takeaway
  DISHES =
  { "burger" => 10,
    "chips" => 4,
    "salad" => 5,
    "lemonade" => 2
  }

  def initialize(client = Twilio::REST::Client.new(
    ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]))
    @text_client = client
  end

  def dishes
    puts "You can order from:"
    DISHES.each do |dish, price|
      puts "#{dish} - £#{price}"
    end
  end

  def place_order(quantities, total)
    fail "incorrect total" if total(quantities) != total
    send_text(confirmation_msg)
  end

  private

  def total(quantities)
    order_total = 0
    quantities.each do |dish, qty|
      order_total += qty * DISHES[dish]
    end
    order_total
  end

  def confirmation_msg
    time = Time.now + (60 * 60)
    "Thank you! Your order was placed and will be delivered before #{time}"
  end

  def send_text(msg)
    @text_client.messages.create(
    from: ENV["TAKEAWAY_PHONE_NO"],
    to: ENV["CUST_PHONE_NO"],
    body: msg
    )
  end
end
