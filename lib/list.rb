require 'CSV'
require 'list_item'
class List

  def initialize
    @menu_items = []
  end

  def view_items(file="takeawaylist.csv")
    reset_menu_items
    load_csv(file)
    print_menu_items
  end

  private

  attr_accessor :menu_items

  def load_csv(file)
    CSV.foreach(file) { |row| build_menu_item(row) }
  end

  def build_menu_item(row)
    name = row[0]
    price = row[1]
    menu_items << ListItem.new({name: name, price: price})
  end

  def reset_menu_items
  end

  def print_menu_items

  end

end
