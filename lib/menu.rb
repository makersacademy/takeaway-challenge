class Menu

  attr_reader :dishes_available

  def initialize
    @dishes_available = {}
  end

  def add(dish)
    if no_dishes_available?
      menu_number = 1
    else
      menu_number = dishes_available.keys.max + 1
    end
    @dishes_available[menu_number] = dish
  end

  def view
    fail "No meal options have been added to this menu" if no_dishes_available?
    dishes_available.each do |k, v|
      puts "#{k}: #{v.name} | Price: £#{v.price}"
    end
  end

  def select(order_number)
    fail "No meal options have been added to this menu" if no_dishes_available?
    fail "There are no dishes matching the number given" unless dishes_available.keys.include?(order_number)
    dishes_available[order_number]
  end

  def no_dishes_available?
    dishes_available.count == 0
  end

end