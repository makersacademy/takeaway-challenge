require 'forwardable'

class Restaurant

  extend Forwardable

  def_delegator :@menu, :list_items, :menu

  def initialize menu_klass=Menu
    @menu_klass = menu_klass
    @menu = @menu_klass.new
  end

  def change_menu new_menu
    @menu = @menu_klass.new new_menu
  end
  # should be class Menu functionality?

  def new_order
  end

end
