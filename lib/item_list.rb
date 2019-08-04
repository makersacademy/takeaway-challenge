require_relative 'dish.rb'

module ItemList

  ERR_DUPLICATE_ITEM = "Menu Item already exists on list"
  ERR_MISSING_ITEM = "Menu Item does not exist on list"
  def initialize(_item_class = Dish)
    @items = []
  end

  def items
    @items.dup
  end

  private
  def add_item(dish)
    # raise ERR_DUPLICATE_ITEM if item_index(dish)
    @items << dish
  end

  def remove_item(dish)
    # raise ERR_MISSING_ITEM unless item_index(dish)
    @items.delete_at(item_index(dish))
  end

  def alter_item(dish)
    items[item_index(dish)].alter(dish)
  end

  # private

  def item_index(dish)
    items.index { |item| dish.name == item.name }
  end

end
