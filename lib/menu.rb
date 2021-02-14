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

  def append(*args)
    args.each { |item| already_there_error(item) }
    add_dishes(args)
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

  def already_there_error(item)
    fail "this item is already on the menu!" if @dishes.include?(item)
  end

end
