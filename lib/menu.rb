class Menu
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def add(added_item, item_price)
    @items.store(added_item, item_price)
  end

  def remove(item_to_remove)
    @items.delete_if{ |item, price| item == item_to_remove}
  end

  def list
    menu = ""
    items.each{|dish, price| menu << "#{dish}: £#{price}, "}
    menu.strip.chomp(",")
  end

end
