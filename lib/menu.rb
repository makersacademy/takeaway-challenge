class Menu
  attr_reader :list
  def initialize
    @list = {}
  end

  def see_menu
    self.list
  end
end
