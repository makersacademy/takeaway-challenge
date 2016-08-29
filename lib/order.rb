require_relative 'menu'
require_relative 'confirmation_system'

class Order
  def initialize(menu = Menu.new, messaging_system = ConfirmationSystem)
    @basket = {}
    @subtotal = 0
    @menu = menu
    @messaging_system = messaging_system
  end

  def add(item)
    @subtotal += @menu.get_price(item)
    if basket.include?(item)
      basket[item] += 1
    else
      basket[item] = 1
    end
    show_basket
  end

  def remove(item)
    fail 'Item not in basket' if basket[item].nil?
    if basket[item] == 1
      basket.delete(item)
    else
      basket[item] -= 1
    end
    @subtotal -= @menu.get_price(item)
    show_basket
  end

  def confirm
    @messaging_system.new.send
  end

  def show_basket
    puts "Your basket:"
    basket.each {|item, quantity|
      puts "#{item}" if quantity == 1
      puts "#{item} x #{quantity}" if quantity > 1}
  end

  private

  attr_reader :basket

end
