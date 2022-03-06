class Order

  attr_accessor :basket
  attr_reader :menu

  def initialize(menu = Menu.new)
    @basket = Hash.new
    @menu = menu
  end

end

#Order.new.view_menu(true)