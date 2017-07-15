class Order

  attr_reader :order

  def initialize(numbers)
    @order = Menu.new.selection(numbers)
  end

end
