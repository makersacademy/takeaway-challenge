class Costumer

  attr_reader :basket

  def initialize (menu)
    @basket = {}
    @menu = menu
  end

  def add(item)
    basket[item] = menu.show[item]
    basket
  end

  private
  attr_reader :menu

end
