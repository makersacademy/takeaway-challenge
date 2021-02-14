require_relative 'dish_lister'

class Menu
  include DishLister
  attr_reader :dishes, :title

  def initialize(name)
    @title = name
    @dishes = []
  end

  def peruse
    puts "Today's menu at #{@title}:"
    puts list_dishes
  end

  def pick(item)
    item_exists(item)
    find_item(item)
  end

private

  def find_item(item)
    @dishes.select { |dish| dish.name == item }[0]
  end

  def item_exists(item)
    fail "this item isn't on the menu" if find_item(item).nil?
  end

end
