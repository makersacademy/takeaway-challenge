
# The menu should hold the 'truth' for the dishes.
class Menu

  ERR_DUPLICATE_ITEM = "Menu Item already exists"
  ERR_MISSING_ITEM = "Menu Item does not exist"
  def initialize(item_class = Dish)
    @items = []
  end

  def items
    @items.dup
  end

  def add_item(dish)
    raise ERR_DUPLICATE_ITEM if item_index(dish)
    @items << dish
  end

  def remove_item(dish)
    raise ERR_MISSING_ITEM unless item_index(dish)
    @items.delete_at(item_index(dish))
  end

  # As the object may be referenced elsewhere we want to update it in place.
  # I can't actually change a dishes name  after initialization.
  # only menu can do that?
  # If something changes on the menu is should change elsewhere

  def alter_item(dish)
    raise ERR_MISSING_ITEM unless(item_index(dish))
    items[item_index(dish)].alter(dish)
  end

  def display
    if items.empty?
      print "\n"
      return "\n"
    end

    output = ""

    items.each do |dish|
      output << "#{dish.name} £#{dish.cost}\n"
    end

    print output
    output
  end

  private

  def item_index(dish)
    items.index{|item| dish.name == item.name}
  end


end