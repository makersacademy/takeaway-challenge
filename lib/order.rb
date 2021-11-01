class Order
  attr_reader :dishes, :menu
  def initialize(menu)
    @menu = menu
    @dishes = {}
  end

  def add(item, amount)
    # Working on functionality to raise an error if someone tries to add an item that is not on the menu
    # fail 'this is not on the menu' if !menu.include_dish?
    dishes[item] = amount
  end
end
