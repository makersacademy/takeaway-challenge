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
    raise "No meal options have been added to this menu" if no_dishes_available?
    dishes_available.each do |k, v|
      puts "#{k}: #{v.name} | Price: £#{v.price}"
    end
  end

  def no_dishes_available?
    dishes_available.count == 0
  end

end