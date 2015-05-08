class Menu
  attr_reader :selected, :dishes
  alias_method :selection, :selected
  alias_method :show_menu, :dishes

  def initialize
    @dishes =
    {
      bigmac: 3.99,
      quater_pounder: 3.99,
      chicken_mcnuggets: 2.50,
      fries: 0.99,
      cheese_burger: 0.99,
      ham_burger: 0.99,
      milk_shake: 0.99
    }
  end

  def select_dishes selected
    @selected = (selected.is_a?(Symbol) ? {selected => 1} : selected)
  end

  def price
    @price = @selected.inject(0) {|memo, item| memo + @dishes[item.first] * item.last}
  end

  def order
    @selected.merge({ total: price.round(2) }) rescue fail 'Please Select at least one item'
  end
end