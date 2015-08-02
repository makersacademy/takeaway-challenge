class Takeaway

  attr_reader :menu, :order, :price, :cust_price

  def initialize
    @menu = { "pizza" => 5.95, "pasta" => 6.45, "curry" => 6.95, "toast" => 0.1, "fajitas" => 6.45, "bacon sandwich" => 3.50, "steak and chips" => 10.95 }
    @order = []
  end

  def place_order(*items,cust_price)
    @cust_price = cust_price

    items.each do |x|
      item_checker(x)
      order << x 
    end

    price_adder

    fail "Your order costs £#{price} not £#{cust_price}" if !same_price?
  end

  def same_price?
    cust_price == price
  end

  private

  def item_checker(item)
    fail "Apologies, we do not have #{item} on the menu." if !menu.include?(item)
  end

  def price_adder
    @price = 0
    order.each { |y| @price += menu[y] }
  end

end