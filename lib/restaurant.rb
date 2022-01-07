class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def menu
    @menu.clone
  end
end
