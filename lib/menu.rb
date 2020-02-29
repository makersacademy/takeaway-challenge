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
    @items.map do |dish, price|
      puts "#{dish.to_s}: £#{price}"
    end
  end

  def has_dish?(dish)
    @items.each_key { |item| item == dish ? true : false }
  end

end
