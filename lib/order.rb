class Order

  def initialize(menu: Dishes.new)
    @menu = menu
  end

  def show_menu
    # This will call menu.show_list
    menu
  end

  private
  attr_reader :menu

end
