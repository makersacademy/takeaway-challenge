
class Options
  attr_reader :menu_items, :menu_options

  def initialize(menu_items)
    p "menu items: #{menu_items}"
    parse_menu_items(menu_items)
    p "@menu_items: #{@menu_items}"
  end

  def request_food_selection
    puts 'Please make a food selection'
    process_selection(gets.chomp.upcase)
  end

  def process_selection(selection)
    'Invalid selection: please check and try again' unless valid_selection(selection)

  end

# private
  def parse_menu_items(menu_items)
    @menu_items = {}
    p "menu_items: #{menu_items}"
    menu_items.split("\n") do |item|
      p "item: #{item}"
      item_split = item.split("\t")
      item_hash = { description: item_split[1], price: item_split[2] }
      @menu_items[item_split[0]] = item_hash
    end
    add_menu_options
  end

  def add_menu_options
    @menu_options = {}

  end

  def valid_selection(selection)
    @menu_items.keys.include?(selection) ||
      @menu_options.keys.include?(selection)
  end
end
