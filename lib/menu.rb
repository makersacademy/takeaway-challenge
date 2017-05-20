
# contains the menu of a restaurant
class Menu
  attr_reader :list, :dish, :price

  def initialize
    @selected_item = nil
    @dish = nil
    @price = nil
    @list = { bean_burger: 8,
            vegan_cheese_platter: 6,
            jack_fruit_burger: 8,
            breaded_aubergine: 7 }
  end

  def selected_item(food)
    list.each { |item| @selected_item = item if item[0] == food }
    check_if_available
    item_info
  end

  def item_info
    @dish = @selected_item[0].to_s.tr('_', ' ')
    @price = @selected_item[1]
  end

  private
  def check_if_available
    raise 'Sorry, that item is not available!' if @selected_item.nil?
  end

end
