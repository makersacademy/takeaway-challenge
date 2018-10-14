class DishView
  def initialize(item)
    @item = item
  end

  def display
    "#{@item.name}\t£#{@item.price}"
  end

end
