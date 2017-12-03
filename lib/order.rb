
class Order

  attr_reader :current_order

  def initialize
    @current_order =[]
  end

  def add_to_order(item)
    @current_order << item
  end

end
