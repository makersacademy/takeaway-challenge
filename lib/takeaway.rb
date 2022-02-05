class Takeaway
  def initialize
    @menu = []
  end

  def view_menu(menu)
    menu.each_with_index do |dish, idx|
      @menu << "\n" if idx != 0
      @menu << format(dish)
    end
    @menu.join
  end

  private

  def format(dish)
     "#{dish.name}: #{price(dish.price)}"
  end

  def price(stored_price)
    sprintf("£%2.2f", stored_price)
  end

end
