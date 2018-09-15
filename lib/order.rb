class Order
  attr_reader :quantity, :name

  def initialize
    @order = []
  end

  def pick(name, quantity)
    @order << {name => quantity}
  end

  def show
    @order
  end
end
