class Order

  def initialize
    @order = []
  end

  attr_reader :order

  def add(item, quantity, price)
    @order << { :item => item, :quantity => quantity, :price => "£#{price} each" }
  end

end
