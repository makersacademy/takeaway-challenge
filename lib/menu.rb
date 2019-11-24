class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      rice: 2.5,
      chips: 3,
      fish: 7 }
  end

  def display_menu
    @dishes.each { |dish, price| puts "#{dish} : £#{price}" }
  end

  def dish?(dish)
    !dishes[dish].nil?
  end

  def price(dish)
    dishes[dish]
  end

end
