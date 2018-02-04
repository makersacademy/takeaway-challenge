class Order

  attr_reader :order

  def initialize
    @order = Hash.new(0)
  end

end
