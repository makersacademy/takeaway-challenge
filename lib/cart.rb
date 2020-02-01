class Cart

  attr_reader :cart, :menu

  def initialize
    @cart = {}
    @menu = { "burger" => 5, "fries" => 3, "shake" => 2 }
  end

  def add_item(item, quantity = 1)
    @cart[item] = 0 unless @cart[item]
    @cart[item] += quantity
    "#{quantity}x #{item} added to your cart"
  end
  
  def summarize
    result = []
    @cart.each do |item, quantity|
      result << "#{item} x #{quantity} = #{(@menu[item]) * (quantity)}"
    end
    result.join(", ")
  end

end
