require_relative 'messenger'
require_relative 'menu'
require_relative 'order'
require_relative 'dish'

class Basket

  attr_reader :selection, :menu

  def initialize(menu = Menu.new)
    @selection = Order.new
    @menu = menu
  end

  def display_menu
    puts @menu.display
  end

  def add_to_selection(number, quantity = 1)
    quantity.times { @selection.items << @menu.list[number - 1] }
  end

  def selection_total
    puts "Your total is £#{@selection.total}"
  end

  def checkout(price, messenger = Messenger.new)
    payment_error(price)
    messenger.message
    confirmation_message
  end

  private

  def payment_error(price)
    raise 'Payment does not equal basket total.' if price != @selection.total
  end

  def confirmation_message
    puts 'Thank you. Text confirmation has been sent.'
  end
end
