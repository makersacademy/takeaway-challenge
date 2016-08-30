class Order

  attr_reader :menu_item
  attr_reader :ordered

  def initialize
    @dishes = {}
    @ordered = false
  end

  def calculate(menu_item)
    menu_item.each do |item, amount|
      menu_item.include?(item) ? menu_item[item] += amount : menu_item[item] = amount
    end
    menu_item
  end

  def show_menu_items
    return items
  end

  def place_order
    @ordered = true
  end
end
