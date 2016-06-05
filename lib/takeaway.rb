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
    dish = input_dish
    message = "#{ dish } not on menu! Check spelling and retry."
    fail message unless @menu.has?(dish)
    @order.add(dish, input_quantity)
    view_order
  end

  def remove
    dish = input_dish
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

    def input_dish
      puts "Enter dish: "
      gets.chomp.downcase
    end

    def input_quantity
      puts "How many would you like?"
      gets.chomp.to_i
    end
end
