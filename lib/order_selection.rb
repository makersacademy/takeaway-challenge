#understands order selection

class OrderSelection
  attr_reader :cart
  attr_accessor :menu

  def initialize
    @cart = []
  end

  def add_item(item,quantity)
    raise "item does not exist" if !@menu.key?(:"#{item}")
    quantity.times {@cart.push(item)}
  end

  def remove_item(item,quantity)
    raise "Amount not available for removal" if @cart.count(item) < quantity
    quantity.times {@cart.delete_at(@cart.index(item))}
  end

end
