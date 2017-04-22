#understands order selection

class OrderSelection
  attr_reader :cart
  attr_accessor :menu

  def initialize
    @cart = []
  end

  def add_item(item)
    raise "item does not exist" if !@menu.key?(:"#{item}")
  @cart.push(item)
  end

  def remove_item(item)
    raise "item does not exist" if !@cart.include?(item)
    @cart.delete(item)
end

end
