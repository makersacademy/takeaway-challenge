class Menu

  def initialize(dishes:)
    @dishes = dishes
  end

  def show_menu
    @dishes.each {|dish| puts "#{dish.name}: £%0.2f" % [dish.price]}
  end
end
