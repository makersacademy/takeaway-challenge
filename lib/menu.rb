require_relative 'menu_item'
require 'csv'

class Menu

  DEFAULT_FILENAME = './lib/takeaway_menu.csv'
  attr_reader :m_items

  def load_from_csv
    @m_items = {}
    CSV.foreach(DEFAULT_FILENAME, headers: true) do |row|
      @m_items[row["number"]] = MenuItem.new(number: row["number"], dish: row["name"], price: row["price"])
    end
  end
end
