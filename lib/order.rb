class Order
  attr_reader :id

  @@orders = []

  def initialize
    @id = 1 + @@orders.count
    @@orders.push(self)
  end

end
