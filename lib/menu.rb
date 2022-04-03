require_relative './dish'
# Creates a list of dishes.

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end
end
