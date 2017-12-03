class Menu
  attr_reader :current_menu

  def current_menu
    @current_menu = {"dish one" => 10, "dish two" => 10}
  end

  def check
    current_menu
  end
end
