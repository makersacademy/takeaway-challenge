class Menu
  def initialize(menu_hash = {})
    @menu = menu_hash
  end

  def upload(menu_hash)
    @menu = menu_hash
  end

  def read
    @menu
  end

end
