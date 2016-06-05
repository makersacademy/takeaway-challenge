require_relative 'order'
require_relative 'menu'
require_relative 'text'

class TakeAway
  def initialize(menu = Menu.new, order = Order.new(menu))
    @menu = menu
    @order = order
  end

  def view_menu
    puts @menu.display
  end

  def order
    dish = get_dish
    message = "#{ dish } not on menu! Check spelling and retry."
    fail message unless @menu.has?(dish)
    @order.add(dish, get_quantity(dish))
    view_order
  end

  def remove
    dish = get_dish
    fail "#{dish} hasn't been ordered" unless @order.has?(dish)
    @order.remove(dish)
    view_order
  end

  def view_order
    puts @order.summary
  end

  def complete_order
    Text.confirmation
    @order = Order.new(@menu)
  end

  private

    def get_dish
      puts "Enter dish: "
      gets.chomp.downcase.to_sym
    end

    def get_quantity(dish)
      puts "How many would you like?"
      gets.chomp.to_i
    end
end
