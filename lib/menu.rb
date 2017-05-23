
# contains the menu of a restaurant
class Menu
  attr_reader :list, :dish, :price

  def initialize(list = Hash.new)
    @selected_item = nil
    @dish = nil
    @price = nil
    @list = list
  end

  def add_item(dish, price)
    @list[dish] = price
  end

  def selected_item(dish)
    list.each { |item| @selected_item = item if item[0] == dish }
    check_if_available
    item_info
  end

  def show_menu
    @list.each_with_index { |item,i| puts "#{i + 1}: #{item[0]}, £#{item[1]}" }
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
