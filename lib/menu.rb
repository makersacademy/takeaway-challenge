class Menu
  def initialize
    @items = {
      :burgers => ["Hamburger", "Cheeseburger", "Chicken burger"],
      :hot_dogs => ["Cheese dog", "Chili dog", "Corn dog"],
      :chicken => ["Southern fried chicken", "Chicken wings"]
    }
  end

  def display
    @items.each do |cat, item|
      puts cat.to_s.gsub(/_/, " ").split.map(&:capitalize).join(" ")
      puts "---"
      puts item
      print "\n"
    end
  end
end
