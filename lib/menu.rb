require 'csv'

class Menu

  
  def initialize(file_name) 
    @file = File.open("./lib/#{file_name}", "r")
    @menu_hash = {}
  end

  def csv_to_hash
    @file.readlines.each do |line|
      key, value = line.chomp.split(",")
      @menu_hash[key] = value
    end
    @menu_hash
  end

  def read_menu
    @file.read
  end
end
