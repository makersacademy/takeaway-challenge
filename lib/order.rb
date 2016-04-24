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

  def total
    item_totals.inject(:+)
  end

  private
  attr_reader :menu

  def item_totals
    dishes.map do |name, quantity|
      menu.price(name) * quantity
    end
  end
end
