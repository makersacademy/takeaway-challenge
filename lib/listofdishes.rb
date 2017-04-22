class ListOfDishes

  def initialize(array)
    @list_of_dishes = array
  end

  def print_list
    string = ''
    list_of_dishes.each_with_index do |dish, index|
      string += "#{dish.name} - #{dish.price}"
      string += "\n" if index < list_of_dishes.length-1
    end
    string
  end

  private
  attr_reader :list_of_dishes

end
