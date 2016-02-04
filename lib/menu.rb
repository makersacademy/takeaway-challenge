
class Menu

  def initialize items={}
    @items = items
  end

  def list_items
    @items.clone
  end

  def add_items item, price
    @items[item] = price
  end

  def remove_item item
    @items.delete(item)
  end

end
