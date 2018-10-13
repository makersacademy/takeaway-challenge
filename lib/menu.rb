class Menu
  attr_accessor :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def add_menu_item(dish)
    @dishes << dish
  end

  def list
    raise 'This menu is empty' if @dishes.empty?
    @dishes.each { |dish| puts "#{dish.dish} :  #{dish.price}" }
  end
end
