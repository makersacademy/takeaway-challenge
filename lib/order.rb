class Order
  attr_reader :cart
  def initialize
    @cart = []
  end

  def add_order(dish, quantity, price)
    @cart << {:dish => dish, :price => price, :quantity => quantity}
  end

  def order_summary
    summary = []
    cart.each { |food| summary << "#{food[:quantity]}x #{food[:dish]} is #{(food[:price])*(food[:quantity])}," }
    summary.last.tr!(',', '.')
    summary.join(" ")
  end

  def total_price
    cart.map{|x| x[:price]*(x[:quantity])}.inject(:+)
    return "Total cost is £#{cart.map{|x| x[:price]*(x[:quantity])}.inject(:+)}."
  end

end
