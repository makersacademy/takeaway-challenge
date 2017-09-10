class Menu

  def initialize(item_array = [[]])
    @item_array = item_array
  end

  def show
    "Welcome to the Catnip emporium:\nThis is our menu"
  end

  def items
    @item_array
  end

end
