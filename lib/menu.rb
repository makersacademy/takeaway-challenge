require_relative 'order'
require 'csv'

class Menu

attr_reader :menu_list
DEFAULT_FILENAME = './lib/takeaway_menu.csv'

  def load_from_csv(filename = DEFAULT_FILENAME)
    csv = CSV.open(filename, :headers => true, :header_converters => :symbol, :converters => :all)
    @menu_list = csv.to_a.map {|row| row.to_hash }
  end

end
