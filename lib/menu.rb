class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    puts "Menu"
    inp = gets.chomp
    dishes.map { |dish, price|
      p "#{dish} £#{('%.2f' % price)}"
      }.to_a.join(", ")
  end

  def available_dish?(dish)
    !!dishes[dish] #not not returns a boolean
  end

  def price(dish)
    dishes[dish]
  end

end
