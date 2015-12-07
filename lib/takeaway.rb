require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu_klass

  def initialize(menu_klass = Menu.new)
    @menu_klass = menu_klass
  end

end
