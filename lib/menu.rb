require 'csv'

class Menu

  def initialize(file)
    @file = file
  end

  def print
    CSV.foreach(@file,:headers => true).map do |row|
      puts "#{$.-1}. #{row['Dish'].upcase}: #{row['Description']} (#{row['Price']})"
    end
  end

  def format_menu
    CSV.new(File.new(@file), :headers => true, :header_converters => :symbol).map(&:to_hash)
  end

end
