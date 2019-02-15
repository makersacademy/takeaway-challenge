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
  end
end
