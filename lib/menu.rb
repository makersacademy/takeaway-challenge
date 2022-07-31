require 'csv'

class Menu
  attr_reader :menu_list

  def initialize(csv_file =  '/lib/menu.csv')
    @menu_list = {}
    pass_csv_to_table(csv_file)
    populate
  end

  def display
    (0...@table.size).each { |index| puts "#{@table[index]["dishes"]} #{@table[index]["prices"]}" }
  end

  def pass_csv_to_table(csv_file)
    @table = CSV.parse(File.read(File.dirname(File.dirname(File.expand_path(__FILE__))) + csv_file), headers: true)
  end

  private

  def populate
    (0...@table.size).each do |index|
      @menu_list[@table[index]["dishes"].to_sym] = @table[index]["prices"]
    end
  end

end
