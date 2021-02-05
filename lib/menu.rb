require 'viewer'
require 'dish'
class Menu
  attr_reader :dishes
  def initialize(*dishes)
    @dishes = dishes
  end

  def view
    Viewer.new.view(@dishes)
  end
end