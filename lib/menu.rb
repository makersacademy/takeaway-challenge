require_relative "dish"
require "csv"

class Menu
  FILENAME = './lib/menu.csv'
  def initialize(filename = FILENAME)
    @filename = filename
    @menu_content = {}
    load_menu
  end

  def menu
    menu_content.dup
  end

  private

  attr_reader :menu_content, :filename

  def load_menu
    CSV.foreach(filename) do |row|
      @menu_content[row[0].to_i] = Dish.new(row[0].to_i, row[1], row[2].to_f)
    end
  rescue
    puts "File doesn't exist. Failed to load file."
  end

end
