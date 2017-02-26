require 'csv'

class Menu

attr_reader :menu

  def initialize(file)
    @file = file
    @menu = []
  end

  def print
    CSV.foreach(@file,:headers => true).map do |row|
      @menu << "#{$.-1}. #{row['Dish'].upcase}: #{row['Description']} (#{row['Price']})"
    end
    puts @menu.join("\n")
  end

  def format_menu
    CSV.new(File.new(@file), :headers => true, :header_converters => :symbol).map(&:to_hash)
  end

end
