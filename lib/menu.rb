class Menu
  def initialize
    @dishes = {
      cheeseburger: 3.00,
      hamburger: 2.00,
      chips: 1.50,
      coke: 1.00,
      water: 0.80
    }
  end

  def show_menu
    @dishes
  end

  def select_dishes selected
    case selected
    when Hash
      fail 'Please select an item' if selected.empty?
      @selected = selected
    else
      @selected = Hash.new { |this, key| this[key] = 'empty' }
      @selected[selected] = 1
    end
    @selected
  end

  def price
    price = 0
    @selected.each do |dish, quantity|
      price += (@dishes[dish] * quantity)
    end
    price
  end

  def selection
    @selected
  end
end