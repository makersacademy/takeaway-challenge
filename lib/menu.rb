class Menu

  def initialize(items)
    @items = items
  end

  def items
    @items.dup
  end

end
