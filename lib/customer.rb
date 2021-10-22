require_relative 'menu'


class Customer

  attr_reader :see_menu
  attr_accessor :current_menu, :current_order

  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = {}
    @current_menu = current_menu
    @current_menu = []
    @current_order = []
  end

  def see_menu
    @current_menu << @menu
    @current_menu
  end

  def add_item(item)
    @current_order << item
  end

  def remove_item(item)

  end
end