require_relative 'menu'

class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def add_dish(pasta)
    @order << pasta
  end
end
