class Menu

  attr_reader :dishes

  def initialize
    @dishes = {dish: 'food', price: 1}
  end

  def display_dishes
    dishes.each_with_index do |(key,value),index|
      print "#{index}: #{value}"
    end

  end

  def select_dishes(index)
    @selected_dishes = {}
  end

end
