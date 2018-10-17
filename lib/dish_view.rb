class DishView
  def initialize(item)
    @item = item
  end

  def display
    name = "#{@item.name}".ljust(30)
    price = "£#{format("%.2f", @item.price)}"
    "  #{name}#{price}"
  end

end
