class Menu

  def initialize(dishes = {})
    @dishes = dishes
  end

  def price(dish)
    1
  end

  def view
    menu_items = ""
    @dishes.each { |dish,price| menu_items+=("#{dish} - £#{'%.2f' % price}\n") }
    menu_items
  end

end
