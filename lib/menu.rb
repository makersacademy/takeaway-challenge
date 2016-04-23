class Menu

  def initialize(dishes:)
    @dishes = dishes
  end

  def show_menu
    @dishes.each {|dish| puts "#{dish.name}: £#{dish.price}"}
  end
end
