class Menu
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def add(added_item, item_price)
    @items.store(added_item, item_price)
  end

  def list
    menu = ""
    items.each{|dish, price| menu << "#{dish}: £#{price}, "}
    menu.strip.chomp(",")
  end

end
