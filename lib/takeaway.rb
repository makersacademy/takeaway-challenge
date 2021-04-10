class TakeAway
  
  attr_reader :menu
  def initialize(menu)
    @menu = menu
  end

  def show
    menu.list
  end
end
