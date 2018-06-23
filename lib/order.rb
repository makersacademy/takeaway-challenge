require_relative './menu.rb'

class Order

  attr_reader :menu

  def initialize(menu_class = Menu)
    @menu = menu_class.new
  end

  def list_options
    @menu.options
  end

end
