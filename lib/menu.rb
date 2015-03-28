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
      @selected = selected
    else
      @selected = Hash.new { |this, key| this[key] = 'empty' }
      @selected[selected] = 1
    end
    @selected
  end

  def price
    @price = 0
    @selected.each do | dish, quantity |
    @price += (@dishes[dish] * quantity)
    end
    @price
  end

  def selection
    @selected
  end

  def order
    fail 'Please Select at least one item' unless @selected
    price
    total = { total: @price.round(2) }
    @order = @selected.merge(total)
  end
end