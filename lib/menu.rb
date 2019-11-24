require 'csv'

class Menu

  def display
    table = CSV.parse(File.read(File.dirname(File.dirname(File.expand_path(__FILE__))) + '/lib/menu.csv'), headers: true)
    (0...table.size).each { |index| puts "#{table[index]["dishes"]} #{table[index]["prices"]}" }
  end

end
