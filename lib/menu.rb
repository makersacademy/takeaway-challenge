require_relative 'menu_item'
require 'csv'

class Menu
# Menu has method #load_from_csv which creates an @m_items hash that looks like:
# { "01" => MenuItem.new(number, name, price) }
# the m_items hash holds instances of MenuItem class
# there is also a display method which makes it look pretty (a nice numbered list or something)

  DEFAULT_FILENAME = './lib/takeaway_menu.csv'
  attr_reader :menu_list

  def load_from_csv
    menu_list = []
    CSV.foreach(DEFAULT_FILENAME, headers: true) do |row|
      menu_list << row.to_hash
    end
  end

end
