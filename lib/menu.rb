class Menu
  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def list_dishes
    @dishes.each { |dish| "#{dish.name.ljust(20,'.')}#{dish.price.to_s.rjust(3,'.')}\n" }
  end
end
