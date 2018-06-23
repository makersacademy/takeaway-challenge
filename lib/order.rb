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

  def list_options
    @menu.options
  end

  def add(dish, quantity)
    @selection.add(dish, quantity)
  end

  # #playing
  # def confirm(total)
  #   confirmation = Confirmation.new(selection.total)
  #   confirmation.check(total)
  # end

end
