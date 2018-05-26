class Order 

  attr_reader :current_items

  def initialize
    @current_items = []
  end

  def add_item(item, quantity)
    @current_items.push([item, quantity])
  end

end

