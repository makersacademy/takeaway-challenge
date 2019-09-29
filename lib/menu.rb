
class Menu

  DEFAULT_DISHES = [
    { name: "Ribeye", price: 3000 },
    { name: "Sirloin", price: 2500 },
    { name: "Fillet", price: 3500 },
    { name: "Porterhouse", price: 4000 },
    { name: "Strip", price: 2000 }
  ]

  def initialize(dishes = DEFAULT_DISHES)
    @dishes = dishes
    update_menu
  end
  
  # def add(dish, price)
  #   @dishes << { name: dish, price: price }
  #   update_menu
  # end

  def list
    puts @menu
  end

  private

  def update_menu
    @menu = []
    @dishes.each { |dish| @menu << format_dish(dish[:name], dish[:price]) }
  end
  
  def format_dish(name, price)
    return "#{name} (£#{price / 100})"
  end
end
