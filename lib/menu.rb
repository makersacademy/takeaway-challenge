class Menu

  attr_reader :items

  def initialize
    @items = Hash.new(0)
  end

  def to_s
    "menu is empty"
  end

  def add_dish(dish, price)
    @items[dish] += price
  end

  def show_menu
    puts "Takeaway Menu" 
    @items.map do |item, price|
      puts "#{item}: #{price}"
    end
  end
end
