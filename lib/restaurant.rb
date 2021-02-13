class Restaurant
  def view_menu
    display.view_menu(menu.meals)
  end

  def add(meal)
    choice = meal.downcase.to_sym
    return 'Please make a valid choice' unless menu.meals.include?(choice)
    order << menu.meals.slice(choice)
    "#{meal.capitalize} has been added to your order 🍕"
  end

  def view_order
    display.view_order(order)
  end

  def place_order
    puts view_order
    confirm_order
  end

  private

  attr_reader :menu, :order, :display

  def initialize(args = {})
    @menu    = args[:menu]    || Menu.new
    @display = args[:display] || Display.new
    @order   = []
  end

  def confirm_order
    puts 'Confirm order? Hit ⏎ to confirm'
    gets.chomp
    'Thanks for your order! Check your phone for confirmation. Buon Appetito!'
  end
end
