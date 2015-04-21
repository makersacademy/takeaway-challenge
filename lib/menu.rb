class Menu
  attr_reader :selected, :dishes
  alias_method :selection, :selected
  alias_method :show_menu, :dishes

  def initialize
    @dishes = {
      cheeseburger: 3.00,
      hamburger: 2.00,
      chips: 1.50,
      coke: 1.00,
      water: 0.80
    }
  end

  def select_dishes selected
    @selected = (selected.is_a?(Symbol) ? { selected => 1 } : selected)
  end

  def price
    @price = 0
    @selected.each do |dish, quantity|
      @price += (@dishes[dish] * quantity)
    end
    @price
  end

  def order
    fail 'Please select an item' unless @selected
    price
    total = { total: @price.round(2) }
    @order = @selected.merge(total)
  end
end