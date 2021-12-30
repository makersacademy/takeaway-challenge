class Menu
  attr_reader :menu
  
  def initialize
    @menu = {}
  end

  def add(dishes)
    arr = dishes.split(", ")
    @menu.merge!(Hash[arr.each_slice(2).to_a])

  end
end

# sample = "Beef Burger, 5, Chicken Burger, 4, Slice of Pizza, 4, Chips, 2.50, Coca-cola, 1, Milkshake, 4, Cookies, 2 "
# menu = Menu.new
# menu.add(sample)
# p menu.menu




