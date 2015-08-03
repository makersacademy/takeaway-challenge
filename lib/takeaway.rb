require_relative "text"
class Takeaway

  attr_reader :menu, :order

  def initialize(text)
    @text=text
    @menu = { "pizza" => 5.95, "pasta" => 6.45, "curry" => 6.95, "toast" => 0.1, "fajitas" => 6.45, "bacon sandwich" => 3.50, "steak and chips" => 10.95 }
    @order = []
    @price = 0
  end

  def place_order(*items,cust_price)
    @cust_price = cust_price

    items.each do |item|
      item_checker(item)
      order << item 
    end

    price_adder

    price_checker

    text_sender
  end

  def same_price?
    cust_price == price
  end

  private

  attr_reader :text, :price, :cust_price

  def item_checker(item)
    fail "Apologies, we do not have #{item} on the menu." if !menu.include?(item)
  end

  def price_adder
    order.each { |y| @price += menu[y] }
  end

  def price_checker
    fail "Your order costs £#{"%.2f"% price} not £#{"%.2f"% cust_price}" if !same_price?
  end

  def text_sender
    time = Time.new + 3600
    @text.send_text("Thank you! Your order was placed and will be delivered before #{ time.strftime("%H:%M") }")
  end
end