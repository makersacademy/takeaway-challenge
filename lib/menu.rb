class Menu

  def initialize(dishes = {})
    @dishes = dishes
  end

  def price(dish)
    "£#{'%.2f' % dish.price}"
  end

  def view
    menu_items = ""
    @dishes.each { |dish,price| menu_items+=("#{dish} - £#{'%.2f' % price}\n") }
    menu_items
  end

end
