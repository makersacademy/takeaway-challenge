require_relative 'dish'
require 'CSV'

class Chef

  DEFAULT_FILE = File.join(Dir.home, 'programs', 'Test Programs', 'takeaway-challenge', 'JohnThomas.csv')

  attr_accessor :source, :menu

  def initialize(menu, source = DEFAULT_FILE)
    @source = source
    @menu = menu
  end

  def create_menu_for(restaurant)
    load_data_from_file
    restaurant.menu = @menu
  end

  def load_data_from_file(filename=DEFAULT_FILE)
    CSV.foreach(filename) do |row|
      @menu.add_dish(Dish.new(row[0],row[1].to_f))
    end
  end

end