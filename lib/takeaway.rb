require_relative 'menu'

class TakeAway

  attr_reader :menu

  def initialize(menu_klass = Menu.new)
    self.menu = menu_klass.new
  end

  private

  attr_writer :menu
end
