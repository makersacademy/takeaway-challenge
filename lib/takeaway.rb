require_relative 'order'

class Takeaway

  attr_reader :order

  MENU = {
    Milano:   19.99,
    Ardente:  19.99,
    Sicilia:  19.99,
    Verona:   19.99,
    Roma:     19.99
  }

  def initialize(order: nil)
    @order = order || Order.new
  end

  def see_menu
    MENU.each { |item, price| puts "#{item} £#{price}" }
  end

end
