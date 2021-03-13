require 'csv'

class FoodMenu
  attr_reader :food_menu

  def initialize
    get_menu
    @menu_printer = MenuPrinter.new
  end

  def display_menu_in_category
    grouped_menu = @food_menu.group_by { |dish| dish["category"] }
    @menu_printer.print_divider_line("*")
    grouped_menu.each do |category, dishes|
      @menu_printer.print_divider_line("-")
      @menu_printer.print_content_line(category)
      @menu_printer.print_divider_line("-")
      dishes.each { |dish| @menu_printer.print_content_line("#{dish["id"]}. #{dish["dish"]} £#{dish["price"]}") }
    end
    @menu_printer.print_divider_line("*")
  end

  private

  def get_menu
    @food_menu = []
    table = CSV.parse(File.read("docs/menu.csv"), headers: true)
    table.each { |row| @food_menu << { "id" => row[0], "category" => row[1], "dish" => row[2], "price" => row[3] } }
  end

end