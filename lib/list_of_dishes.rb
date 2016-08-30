class ListOfDishes

  def initialize
    @dishes = {burger: 9, fries: 3, sandwich: 6}
  end

  def display_list
    @dishes.map { |k,v| "#{k} - #{v}\n" }
  end

end
