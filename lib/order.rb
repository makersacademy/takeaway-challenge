require_relative 'menu'
class Order
  attr_reader :new_order

  def initialize 
    @new_order = {}
  end

  def add 
    @new_order = {burger: 10}
  end

end
