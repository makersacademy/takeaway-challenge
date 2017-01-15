class Menu

attr_reader :dishes, :items

  def initialize
    @items = Array.new
  end

  def add_dish(dish)
    a_dish = Array.new                #each dish is an array
    a_dish << dish.name.capitalize!   #name is 0th in array
    a_dish << dish.price              #price is 1st in array
    @items << a_dish                  #each dish array is put in the @items array of the menu
  end

  def show_items
    n = 0
    @items.each do |name,price|
      n += 1
      puts "#{n} #{name}, £#{price}"
    end
  end

end
