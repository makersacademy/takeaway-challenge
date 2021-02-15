require "./lib/menu.rb"

class Order

attr_reader :order

  def initialize
    @order = []
  end

  def tick(item)
    @order << item
  end

end
