class DishView
  def initialize(item)
    @item = item
  end

  def display
    name = "#{@item.name}".ljust(30)
    price = "£#{@item.price}"
    "  #{name}#{price}"
  end

end
