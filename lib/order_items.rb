class OrderItems

  attr_reader :list

  def initialize(menu)
    @menu = menu
    @list = {}
    @locked = false
  end

  def add(item, quantity)
    add_checks(item, quantity)
    push_item(item, quantity)
  end

  def remove(item, quantity)
    remove_checks(item, quantity)
    remove_item(item, quantity)
  end

  def lock
    @locked = true
  end

  def locked?
    @locked
  end

  private

  def push_item(item, quantity)
    item = item.name
    !list[item] ? @list[item] = quantity : list[item] += quantity
  end

  def remove_item(item, quantity)
    item = item.name
    list[item] -= quantity
    list.delete(item) if list[item] <= 0
  end

  def add_checks(item, quantity)
    raise "This order is closed" if locked?
    raise "This dish is not available" unless item_on_menu?(item)
  end

  def remove_checks(item, quantity)
    raise "This order is closed" if locked?
    raise "No #{item.name} currently in order" unless item_in_order?(item)
  end

  def item_in_order?(item)
    !list[item.name].nil?
  end
  
  def item_on_menu?(item)
    @menu.dishes.include?(item)
  end

end