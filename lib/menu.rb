require 'csv'

class Menu
  attr_reader :menu_list

  def initialize
    @menu_list = {}
  end

  def display
    (0...@table.size).each { |index| puts "#{@table[index]["dishes"]} #{@table[index]["prices"]}" }
  end

  def populate
    (0...@table.size).each do |index|
      @menu_list[@table[index]["dishes"].to_sym] = @table[index]["prices"]
    end
  end

  def pass_csv_to_table
    @table = CSV.parse(File.read(File.dirname(File.dirname(File.expand_path(__FILE__))) + '/lib/menu.csv'), headers: true)
  end
end

menu = Menu.new
menu.pass_csv_to_table
menu.populate
print menu.menu_list
#menu.menu_list
# menu.display
