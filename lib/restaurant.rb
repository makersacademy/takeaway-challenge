class Restaurant

  def initialize (menu = Menu.new)
    @menu = menu
  end

  def steakhouse
    @menu.steakhouse
  end


end
