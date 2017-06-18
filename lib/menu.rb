
class Menu

  attr_reader :dishes

  def initialize
    @dishes = {'pizza' => 6, 'kebab' => 4, 'burrito' => 7}
  end

  def add(name, price)
    @dishes.store(name, price)
  end

  def display_menu
  @dishes.each_with_index {|(food, price), index| puts "#{index + 1} - #{food} : £#{price}0"}
  end
end
