class Menu

  attr_reader :dishes_available

  def initialize
    @dishes_available = {}
  end

  def add(dish)
    if dishes_available.count > 0
      menu_number = dishes_available.keys.max + 1
    else
      menu_number = 1
    end
    @dishes_available[menu_number] = dish
  end

  def view
    dishes_available.each do |k, v|
      puts "#{k}: #{v.name} | Price: £#{v.price}"
    end
  end

end