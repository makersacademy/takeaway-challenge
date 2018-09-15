class Order
  attr_reader :quantity, :name

  def initialize
    @order = []
    @bill = 0
    @quantity = 0
  end

  def pick(name, quantity)
    @quantity += quantity
    @order << {name => quantity}
  end

  def show
    @order
  end

end
