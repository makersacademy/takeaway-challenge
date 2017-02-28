class Menu

  def initialize(dishes = [{name: :lamb_chops, price: 7.0},{name: :chicken_karahi, price: 7.5},{name: :naan, price: 2.95}])
    @dishes = dishes
  end

  def dishes
    @dishes.dup
  end
end
