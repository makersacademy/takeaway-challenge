
class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = [
      {num: 1, dish: "Chicken Soup", price: 3.45},
      {num: 2, dish: "Spicy Hamburger", price: 8.99},
      {num: 3, dish: "Spaghetti Bolognese", price: 7.65},
      {num: 4, dish: "Spring Salad", price: 4.55},
      {num: 5, dish: "Spring Rolls", price: 3.69},
      {num: 6, dish: "Sweet and Sour Soup", price: 3.49},
      {num: 7, dish: "Chicken Sechuan", price: 5.99},
      {num: 8, dish: "Diet Coke", price: 1.99},
      {num: 9, dish: "Sparkling Water", price: 1.12},
      {num: 10, dish: "Poppy Mochi", price: 3.99},
      {num: 11, dish: "Red Beans Mochi", price: 3.89},
      {num: 12, dish: "Rice Noodles", price: 2.99}
    ]
  end


  def display
    puts "The menu:".center(50)
    puts "---------".center(50)
    puts "Food name ------------------------- price".center(50)
    puts ""
    self.menu_items.each do |item|
        puts "#{item[:num]}. #{item[:dish]}".ljust(25) + "...£#{item[:price]}".rjust(25)
    end
  end
end
