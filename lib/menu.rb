
class Menu

  attr_reader :items

  def initialize
    @items = []
  end

  def add_to_menu(food, price)
    self.items << {food => price}
  end

  def display
    create_menu
    list_length = @items.length
    puts "The menu:".center(50)
    puts "---------".center(50)
    puts "Food name ------------------------- price".center(50)
    puts ""
    self.items.each_with_index do |item, index|
        item.each do |n, k|
          puts " #{index + 1}. #{n}".ljust(25) + "...£#{k}".rjust(25)
        end
      end
    end

  def create_menu
    add_to_menu("Chicken Soup", 3.45)
    add_to_menu("Spicy Hamburger", 8.99)
    add_to_menu("Spaghetti Bolognese", 7.65)
    add_to_menu("Spring Salad", 4.55)
    add_to_menu("Spring Rolls", 3.69)
    add_to_menu("Sweet and Sour Soup", 3.49)
    add_to_menu("Chicken Sechuan", 5.99)
    add_to_menu("Diet Coke", 1.99)
    add_to_menu("Sparklin Water", 1.12)
    add_to_menu("Poppy Mochi", 3.99)
    add_to_menu("Red Beans Mochi", 3.89)
    add_to_menu("Rice Noodles", 2.99)
  end

end
