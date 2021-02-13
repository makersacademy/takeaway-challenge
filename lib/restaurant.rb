class Restaurant
  def view_menu
    display.view_menu(menu.meals)
  end

  def add(meal)
    choice = meal.downcase.to_sym
    fail 'Please make a valid choice' unless menu.meals.include?(choice)
    order << menu.meals.slice(choice)
    display.confirm_added(meal)
  end

  def view_order
    display.view_order(order)
  end

  def place_order
    puts view_order
    confirm_order
    order.clear
  end

  private

  attr_reader :menu, :order, :display

  def initialize(args = {})
    @menu    = args[:menu]    || Menu.new
    @display = args[:display] || Display.new
    @order   = []
  end

  def confirm_order
    puts 'Confirm order? Hit ⏎ to confirm or c to cancel'
    gets.chomp
    'Thanks for your order! Check your phone for confirmation. Buon Appetito!'
  end
end
