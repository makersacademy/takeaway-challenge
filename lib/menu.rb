class Menu
  attr_reader :dishes
  
  def initialize
    @dishes = {}
  end

  def add(dishes)
    arr = dishes.split(", ")
    @dishes.merge!(Hash[arr.each_slice(2).to_a])
  end

  def list
    @dishes.map do |key, value|
      puts "#{key} £#{value}"
    end
  end
end

# sample = "Beef Burger, 5, Chicken Burger, 4, Slice of Pizza, 4, Chips, 2.50, 
# menu = Menu.new
# menu.add(sample)
# p menu.menu
