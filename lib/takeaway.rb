class Takeaway
  DISHES =
    { "burger" => 10,
      "chips" => 4,
      "salad" => 5,
      "lemonade" => 2
    }

  def dishes
    puts "You can order from:"
    DISHES.each do |dish, price|
      puts "#{dish} - £#{price}"
    end
  end

  def place_order(quantities, total)
    fail "incorrect total" if total(quantities) != total
    send_text
  end

  private

  def total(quantities)
    order_total = 0
    quantities.each do |dish, qty|
      order_total += qty * DISHES[dish]
    end
    order_total
  end

  def send_text
    account_sid = 'AC7b5c9ad95b7241e75887aa2d396413f0'
    auth_token = '274da3a26e6a7adf5749d969ca2374a9'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = "+441412801981" # Your Twilio number
    to = '+15555555555' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Hey friend!"
    )
  end
end
