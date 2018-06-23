require_relative './menu.rb'
require_relative './selection.rb'

class Order

  attr_reader :menu, :selection

  def initialize(menu_class = Menu, selection_class = Selection)
    @menu = menu_class.new
    @selection = selection_class.new
  end

  def list_options
    @menu.options
  end

  def add(choice)
    @selection.add(choice)
  end

end
