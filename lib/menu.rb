class Menu
  attr_reader :dishes

  def initialize(*args)
    @dishes = args
  end

  def peruse
    puts "TODAY'S MENU:"
    @dishes.each { |dish| puts "#{dish.name}, £" + "%.2f" % dish.price }
  end

  def pick(item)
    item_exists(item)
    find_item(item)
  end

private

  def find_item(item)
    @dishes.select { |dish| dish.name == item }
  end

  def item_exists(item)
    fail "this item isn't on the menu" if find_item(item) == []
  end

end
