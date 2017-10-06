class Menu
  attr_reader :dishes

  def show_dishes
    @dishes = [item: :sushi, price: 7]
  end
end
