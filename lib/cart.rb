class Cart

  attr_reader :cart, :menu

  def initialize
    @cart = Hash.new(0)
    @menu = { "burger" => 5, "fries" => 3, "shake" => 2 }
  end

  def add_item(item, quantity = 1)
    @cart[item] += quantity
    "#{quantity}x #{item} added to your cart"
  end
  
  def summarize
    result = []
    @cart.each { |item, quantity| result << "#{item} x #{quantity} = #{@menu[item] * quantity}" }
    result.join(", ")
  end

  def total
    sub_totals = []
    @cart.each { |item, quantity| sub_totals << (@menu[item] * quantity) }
    "Total: £#{sub_totals.sum}"
  end

end
