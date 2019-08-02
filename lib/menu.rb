require_relative "item_list.rb"
require_relative "dish.rb"
# The menu should hold the 'truth' for the dishes.
class Menu

  include ItemList

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