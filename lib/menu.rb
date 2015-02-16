class Menu

  attr_reader :food_holder

  def initialize
    @food_holder = []
  end

  def add_dish(dish)
    if @food_holder.include?(dish)
    raise "Dish already added"
    else
      @food_holder << dish
    end
  end

  def print_menu
    result = ''
    @food_holder.each do |dish|
      result << "#{dish.name} -- $#{dish.price}"
    end
    result
  end

  def remove_dish(dish)
    @food_holder.delete(dish)
  end

end