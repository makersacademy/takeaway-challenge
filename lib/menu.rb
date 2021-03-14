require 'csv'
require_relative 'global_constants'

class Menu
  attr_reader :food_menu

  def initialize
    get_menu
  end

  def display_menu_in_category
    divider_len = GlobalConstants::DIVIDER_LEN
    border_div = GlobalConstants::BORDER_DIV
    section_div = GlobalConstants::SECTION_DIV
    grouped_menu = @food_menu.group_by { |dish| dish["category"] }
    display_menu = border_div * divider_len
    grouped_menu.each do |category, dishes|
      display_menu += "\n" + section_div * divider_len + "\n" + category + "\n" + section_div * divider_len
      dishes.each { |dish| display_menu += "\n" + "#{dish["id"]}. #{dish["dish"]} £#{dish["price"]}" }
    end
    display_menu += "\n" + border_div * divider_len
  end

  def get_item(id)
    @food_menu.select { |x| x["id"] == id }.first
  end

  private

  def get_menu
    @food_menu = []
    table = CSV.parse(File.read("docs/menu.csv"), headers: true)
    table.each { |row| @food_menu << { "id" => row[0], "category" => row[1], "dish" => row[2], "price" => row[3] } }
  end

end