
class Order

attr_reader :items, :menu
  def initialize(menu)
    @items = {}
    @menu = menu
  end

  def add_item(item, quantity)
    raise "Selected item is not on the menu" unless menu.has_item?(item)
    items[item] = quantity
  end

  def total_amount
    total_number_of_items.inject(:+)
  end

  def total_number_of_items
    items.map do |item, quantity|
      menu.price(item) * quantity
    end
  end

end
