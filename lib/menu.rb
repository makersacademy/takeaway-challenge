require_relative 'order'
require 'csv'

class Menu

  attr_reader :menu_list
  DEFAULT_FILENAME = './lib/takeaway_menu.csv'

  def load_from_csv(filename = DEFAULT_FILENAME)
    @menu_list = []
    CSV.foreach(filename, headers: true) do |row|
      @menu_list << row.to_hash
    end
  end

end
