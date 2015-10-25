require_relative 'menus'

class Restaurant

  include Menus
  attr_reader :menu

  def initialize(type)
    @menu = MENUS[type]
  end

end
