class Order

  attr_reader :total

  def initialize(order_hash, menu_hash)
    @order_hash = order_hash
    @menu = menu_hash
    @order_hash.is_a?(Hash) ? @total = total : @total = "n/a"
  end

  def total
    total = 0
    @order_hash.each do |key,value|
      total += @menu[key].price * value
    end
    total
  end

end
