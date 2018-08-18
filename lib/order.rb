require_relative './menu.rb'
require_relative './selection.rb'
require_relative './summary.rb'
require_relative './confirmation.rb'

# Order delegates responsibility to other classes
class Order

  attr_reader :menu, :selection

  def initialize(menu_class = Menu, selection_class = Selection)
    @menu = menu_class.new
    @selection = selection_class.new
  end

  def show_menu
    @menu.options
  end

  def add(dish, quantity)
    @selection.add(dish, quantity)
    "#{quantity}x #{dish} added to your order"
  end

  # # not tested
  # def confirm(given_total, confirmation_class = Confirmation)
  #   confirmation = confirmation_class.new(given_total, @selection.total)
  #   confirmation.place_order
  # end

end
