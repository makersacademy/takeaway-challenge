require 'csv'
# Can't figure out how to put csv files in a separate folder.
# It always seems to return an error.

class Menu

  def initialize(file_name) 
    @file = File.open("./lib/#{file_name}_menu.csv", "r")
    @menu_hash = {}
    @printed_menu = []
  end

  def csv_to_hash
    @file.readlines.each do |line|
      key, value = line.chomp.split(",")
      @menu_hash[key] = value
    end
    @menu_hash
  end

  def read_menu
    if @printed_menu.empty?
      csv_to_hash
      @menu_hash.each do |item, price|
        @printed_menu << "#{item}, £#{price}"
      end
    end
    @printed_menu.join("\n")
  end
end
