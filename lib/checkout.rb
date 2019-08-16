class Checkout
  attr_reader :basket
  def initialize
    @basket = []
  end
  def show_menu(menu)
    menu.list
  end
end
