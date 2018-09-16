class Takeaway

  def initialize(menu_class = Menu)
    @menu_class = menu_class
  end

  def print_menu
    menu_class.printing_menu
  end

  private

  attr_reader :menu_class
end
