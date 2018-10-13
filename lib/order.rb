class Order
  attr_reader :current_order

  def initialize(mobile_num = 001)
    @mobile_num = mobile_num
    @current_order = []
  end

  def add(*foods)
    @current_order += foods
  end

  def view
    @current_order
  end

end
