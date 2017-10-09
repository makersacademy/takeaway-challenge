class Order

  attr_reader :current

  def initialize
    @current = {}
  end

  def total
    @current.values.sum
  end
end
