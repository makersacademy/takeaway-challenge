class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(name,quantity)
  fail "#{name.capitalize} is not on the menu!" unless menu.has_name?(name)
    dishes[name] = quantity
  end

  private

  attr_reader :menu
end
