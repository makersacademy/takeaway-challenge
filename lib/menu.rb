class Menu
    attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def remove_item(item)
    raise "#{item} does not exist on the menu" if !items.include?(item)
    @items.delete(item)
  end

end
