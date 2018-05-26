class Order 

  def initialize
    @current_items = []
  end

  def add_item(item, quantity)
    @current_items.push([item, quantity])
  end

  def current_items
    @current_items
  end

end

