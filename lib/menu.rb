class Menu

  attr_reader :items

  def initialize
    @items = Hash.new(0)
  end

  def add_dish(dish, price)
    @items[dish] += price
  end

  def show_menu
    puts "Takeaway Menu\n-------------" 
    @items.map.with_index do |(dish, price), index|
      puts "#{index + 1}. #{dish.capitalize}: £#{price}"
    end
  end

  def price(dish)
    @items[dish]
  end

  def dish?(dish)
    @items.key?(dish)
  end

end
