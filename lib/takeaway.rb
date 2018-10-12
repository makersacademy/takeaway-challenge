class Takeaway
  def initialize(menu_class)
    @menu_class = menu_class
    @menu = nil
  end

  def list_dishes
    menu.list_dishes
  end

  private

  def menu
    @menu ||= @menu_class.new
  end
end
