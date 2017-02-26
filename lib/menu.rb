class Menu

  def initialize(file)
    @file = file
  end

  def print
    CSV.foreach(@file,:headers => true) do |row|
      puts "#{$.-1}. #{row['Dish'].upcase}: #{row['Description']} (#{row['Price']})"
    end
  end

end
