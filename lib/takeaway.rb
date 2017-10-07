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
    menu.dishes.each do |item, price|
        @basket[item] = price if item.include?(dish)
        "You've added #{dish} to your basket"
    end
    @basket
  end

end
