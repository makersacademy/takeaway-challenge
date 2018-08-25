class Menu
attr_reader :dishes

  def initialize(dishes = [])  # (dishes = [{ 'pie' => 3, 'mash' => 2, "peas" => 1 }])
    @dishes = dishes            # (dishes = Dish::DISH_LIST)
  end

  def list 
    raise 'This menu is empty' if nothing_on_menu?
    @dishes.each { |dish| puts "#{dish.name}  :  #{dish.price}" }
  end

  private

  def nothing_on_menu?
    @dishes.empty? 
  end

end
