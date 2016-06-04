class Order

  def initialize(item, quantity=1)
    fail 'unknown item inputted, please enter an item on the menu' if check_menu(item) == false
  end

  def add(item, quantity)
  end

  private

  def menu
    @menu = Menu.new
  end

  def check_menu(item)
    menu.show.include? (item)
  end

end
