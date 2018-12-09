require_relative 'menu'

class Order

  attr_reader :menu, :total_order

  def initialize
    @menu = Menu
    @total_order = []
  end

  def add(input)

  end

end
