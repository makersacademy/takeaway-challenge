require 'menu'
class Options
  attr_reader :menu_items, :menu_options

  def initialize(menu = Menu.new)
    @menu = menu
    parse_menu_items
  end

  def request_food_selection
    puts 'Please make a food selection'
    process_selection(gets.chomp.upcase)
  end

  def process_selection(selection)
    raise 'Invalid selection: please check and try again' unless valid_selection(selection)

  end

private
  def parse_menu_items
    @menu_items = {}
    @menu.split("\n") do |item|
      item_split = item.split("\t")
      item_hash = { description: item_split[1], price: item_split[2] }
      @menu_items[item_split[0]] = item_hash
    end
    add_menu_options
  end

  def valid_selection(selection)
    @menu_items.keys.include?(selection)
  end
end
