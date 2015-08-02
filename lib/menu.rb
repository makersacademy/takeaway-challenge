class Menu

  DISHES = { 'Pizza' => 5,
             'Pasta' => 4,
             'Lasagne' => 5,
             'Steak' => 6,
             'Cod' => 5 }

  def initialize dishes = DISHES
    @dishes = dishes
  end

  def show_menu
    result = ''
    @dishes.each do |dish, price|
      result += ("#{dish}, £ #{price}\n")
    end
    result
  end
end