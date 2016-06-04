class Order

  def initialize(item, quantity=1)
    check_input(item)
    @order = {item => quantity}
  end

  def add(item, quantity=1)
    check_input(item)
    return @order += {item => quantity} if @order[item]
    @order = {item => quantity}
  end

  def view
    @order
  end

  def place
  end

  private

  def check_input(item)
    fail 'unknown item inputted, please enter an item on the menu' if check_menu(item) == false
  end

  def menu
    @menu = Menu.new
  end

  def check_menu(item)
    menu.show.include? (item)
  end

end
