class Totalizer

  attr_reader :order_hash, :menu_hash

  def initialize(order_hash:, menu_hash:)
    @order_hash = order_hash
    @menu_hash = menu_hash
  end

  def total
    output = 0
    order_hash.each { |meal, quantity|
      output += (menu_hash[meal] * quantity)
    }
    sprintf('%.2f', output)
  end

end
