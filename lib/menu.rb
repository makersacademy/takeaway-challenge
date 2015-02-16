class Menu

  attr_reader :food_holder

  def initialize
    @food_holder = []
  end

  def add_dish(dish)
    @food_holder << dish
  end

  def print_menu
    result = ''
    @food_holder.each do |dish|
      result << "#{dish.name} -- $#{dish.price}"
    end
    result
  end

end