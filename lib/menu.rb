
# contains the menu of a restaurant
class Menu
  attr_reader :list, :dish, :price

  def initialize
    @selected_item = nil
    @dish = nil
    @price = nil
    @list = {}
  end

  def add_item(dish, price)
    @list[dish] = price
  end

  def selected_item(dish)
    list.each { |item| @selected_item = item if item[0] == dish }
    check_if_available
    item_info
  end

  def item_info
    @dish = @selected_item[0].to_s.split('_').map(&:capitalize).join(' ')
    @price = @selected_item[1]
  end

  private
  def check_if_available
    raise 'Sorry, that item is not available!' if @selected_item.nil?
  end
end
