require_relative 'menu'

class Interface

  attr_accessor :dishes_menu, :order

  def initialize(name, dishes_menu, dish_list, order, take_away)
    @dishes_menu = dishes_menu.new(dish_list)
    @order = order.new(dish_list)
    @name = name
    @take_away = take_away

  end

  def welcome
    print "Welcome to #{name}, if you are hungry you came to the right place!\n\n"
  end

  def actions_menu
    print "    Input '1' to see our dishes menu.\n
    Input '2' to place an order.\n
    Input '3' to check the status of your order.\n
    Input '9' to exit.\n"
  end

  def get_answer
    answer = gets.chomp
  end

  def place_order
    self.order.ordering_menu
    puts "Is your order complete? (yes/no)"
    if gets.chomp == "no"; self.order.ordering_menu
    elsif gets.chomp == "yes"; self.take_away.new(order)
    else
    end
  end

  def execute_action(answer)
    case answer
    when "1"; self.dishes_menu.show_dishes
    when "2"; place_order
    when "3"; puts "order status be here soon\n"
    when "9"; puts "See you next time!"
      exit
    else puts "Please choose a number corresponding to your preferred action"
    end
  end

  def interact
    welcome
    loop do
      actions_menu
      execute_action(get_answer)
    end
  end

  private
  attr_reader :name

end
