class Menu
  def initialize
    @items = {
      :burgers => {"Hamburger" => 5, "Cheeseburger" => 6, "Chicken burger" => 4},
      :hot_dogs => {"Cheese dog" => 5, "Chili dog" => 6, "Corn dog" => 4},
      :chicken => {"Southern fried chicken" => 4, "Chicken wings" => 6}
    }
  end

  def display
    @items.each do |cat, items|
      puts cat.to_s.gsub(/_/, " ").split.map(&:capitalize).join(" ")
      puts "---"
      items.each do |food, price|
        puts food + ", £" + price.to_s
      end
      print "\n"
    end
  end
end
