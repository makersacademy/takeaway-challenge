#understands dishes
require_relative "dish"
require "csv"

class Menu
  FILENAME = './lib/menu.csv'
  def initialize(filename = FILENAME)
    @filename = filename
    @menu_content = Hash.new(0)
    load_menu #loads input file at creation of menu instance
  end

  def menu
    menu_content.dup #returns a copy of the menu
  end

  private

  attr_reader :menu_content, :filename

  def load_menu
    #load content of menu.csv and creates dish objects
    CSV.foreach(@filename) do |row|
      @menu_content[row[0].to_i] = Dish.new(row[0].to_i, row[1], row[2].to_f)
    end
  rescue
    puts "File doesn't exist. Failed to load file."
  end

end
