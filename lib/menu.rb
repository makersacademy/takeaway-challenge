class Menu

  def initialize
    @menu = [
      {:name => "Cheeseburger", :price => 11.95},
      {:name => "Pancakes", :price => 9.00},
      {:name => "New Mexican Omelet", :price => 9.10},
      {:name => "California Chicken Wrap", :price => 11.50},
      {:name => "Sunday Brunch", :price => 15.45},
      {:name => "Water", :price => 1.25}
    ]
  end

  def print_menu
    index = 1
    @menu.each do |hash|
      puts "#{index}: #{hash[:name]} - £#{sprintf("%.2f", hash[:price])}"
      index += 1
    end
  end

end
