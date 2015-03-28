class Menu

  def initialize
    @dishes = {
        bigmac: 3.99,
        quater_pounder: 3.99,
        chicken_mcnuggets: 2.50,
        fries: 0.99,
        cheese_burger: 0.99,
        ham_burger: 0.99,
        milk_shake: 0.99
      }
  end

  def show_menu
    @dishes
  end

  def select_dishes selected
    case selected
    when Hash
      fail 'Please Select at least one item' if selected.empty?
      @selected = selected
    else
      @selected = Hash.new { |this, key| this[key] = 'empty' }
      @selected[selected] = @dishes[selected]
    end
    @selected
  end

  def price
    @selected.values.pop
  end
end