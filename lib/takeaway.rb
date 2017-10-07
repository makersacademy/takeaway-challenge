class TakeAway
  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
  end

  def read_menu
    menu.show
  end

  def order(dish)
    raise "Sorry item is not on the menu!" if !menu.on_menu?(dish)
    add(dish)
    @basket
  end

  private

  def add(dish)
    menu.dishes.each do |item, price|
        @basket[item] = price if item.include?(dish)
        "You've added #{dish} to your basket"
    end
  end

end
