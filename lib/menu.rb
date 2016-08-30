#understands dishes
require_relative "dish"
require "csv"

class Menu
  FILENAME = './lib/menu.csv'
  def initialize(filename = FILENAME)
    @filename = filename
    @menu_content = Hash.new(0)
  end

  def menu
    menu_content.dup #returns a copy of the menu
  end

  def load_menu(filename = @filename)
    #load content of menu.csv and creates dish objects
    CSV.foreach(filename) do |row|
      id, price = row[0].to_i, row[2].to_f.round(2)
      @menu_content[id] = Dish.new(id, row[1], price)
    end
  rescue
    "File doesn't exist. Failed to load file."
  end

  private

  attr_reader :menu_content

end
