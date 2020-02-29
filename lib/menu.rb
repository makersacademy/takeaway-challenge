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
      puts "#{dish}: £#{price}"
    end
  end

  def price(dish)
    @items[dish]
  end

  def has_dish?(dish)
    @items.key?(dish)
    
    # .each_key { |item| 
    # if item == dish 
    #   return true
    # else
    #   return false
    # end
    # }
  end

end
