require_relative 'dish'

class Menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def read_menu
    @menu.dup
  end

  def contains?(dish)
    @menu.include?(dish)
  end

private
  attr_reader :menu


end
