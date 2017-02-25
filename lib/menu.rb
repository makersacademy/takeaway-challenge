class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(item, price)
    @dishes << {item => price}
  end

  def print_menu
    @dishes.map do |dish|
      dish.each do |item, price|
        return "#{item}: £#{price}"
      end
    end
  end
end
