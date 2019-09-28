
class Menu

  def initialize
    @dishes = []
  end
  
  def add(dish, price)
    @dishes << { name: dish, price: price }
  end

  def list
    puts update_menu
  end

  private

  def update_menu
    output = []
    @dishes.each { |dish| output << format_dish(dish[:name], dish[:price]) }
    return output
  end
  
  def format_dish(name, price)
    return "#{name} (£#{price / 100})"
  end
end
