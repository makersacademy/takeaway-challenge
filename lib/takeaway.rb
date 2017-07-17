require_relative 'menu'

class Takeaway

  @@pizzas = {
    "Margherita" => 6,
    "Funghi" => 7,
    "Pollo" => 8,
    "Pescatore" => 9,
    "Vesuvio" => 8,
    "Quattro Formaggi" => 7,
    "Diavolo" => 8,
    "Capricciosa" => 8,
    "La Bella Vita" => 9,
    "Milanese" => 8
  }

  attr_reader :basket, :menu, :total

  def initialize
    @menu = @@pizzas
    @basket = []
    @total = 0
  end

  def display_menu
    print @menu
  end

  def order(item, number = 1)
    fail "That's not on the menu!" unless menu.has_key?(item)
    print "#{number} #{item}s added to basket." if number > 1
    print "#{number} #{item} added to basket." if number == 1
    number.times {@basket << item}
    @total += @menu[item] * number
  end

  def display_basket
    fail "Basket empty. Please order something." if @basket == []
    @basket
  end

  def display_total
    print @total
  end

  def checkout
    print "Order confirmed. You have been charged £#{@total}"
    send_text
  end

  def send_text
    #twilio
  end
end
