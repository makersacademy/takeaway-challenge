class Interface

  attr_reader :menu, :selection

  def initialize
    @menu = Menu.new
    @selection = []
  end

  def view_menu
    menu.board
  end

  def choice(argument)
    selection << view[argument - 1]
  end




end
