require_relative 'order'

class Takeaway

  MENU = {
    Milano:   19.99,
    Ardente:  19.99,
    Sicilia:  19.99,
    Verona:   19.99,
    Roma:     19.99
  }

  def see_menu
    MENU.each do |item, price|
      puts "#{item} £#{price}"
    end
  end
end
