require_relative './menu.rb'

class Order

  attr_reader :user_order, :menu

  def initialize(menu = Menu.new)
    @user_order = []
    @menu = menu
  end

  def display_menu
    @menu.display
  end

  def generate_order
    @user_order << Dish.new("1 name", 12)
  end

  def compose_order(list)
    message = "You ordered:\n"
    list.each do |dish|
      message << "One dish of #{dish.name}\n"
    end
    message << "We hope you like it"
  end

  def display
    list = generate_order
    puts compose_order(list)
  end

end
