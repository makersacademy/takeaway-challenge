class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def contains?(dish)
    dish_names.include?(dish)
  end

  def dish_names
    @dishes.map { |dish| dish.name }
  end

  def lookup_price(name)
    @dishes.select{ |dish| dish.name == name }.first.price
  end

  def display
    puts "-------------MENU-------------"
    @dishes.each do |dish|
      puts "#{dish.name}: #{dish.price}"
    end
    puts "------------------------------"
  end

end