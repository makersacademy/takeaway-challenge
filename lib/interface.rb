require "./lib/takeaway.rb"
require "./lib/customer.rb"
require "./lib/messenger.rb"
require "./lib/menu.rb"

class Interface
  def initialize(menu = Menu.new)
    @menu = menu.menu
    @prices = menu.prices
  end

  def show_options
    ['1) Whats on the menu?', '2) Let me order!', '3) Whats in my basket?', '4) Checkout', '5) Exit']
  end

  def menu

  end
end
