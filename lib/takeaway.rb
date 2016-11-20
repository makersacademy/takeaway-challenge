require './lib/menu'
require './lib/order'
class TakeAway

attr_reader :menu_klass, :basket, :total

  def initialize(menu_klass)
    @menu_klass = menu_klass
    @basket = Hash.new
  end

  def read_menu
    @menu_klass.menu
  end

end
