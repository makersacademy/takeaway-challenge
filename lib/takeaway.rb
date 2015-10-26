require_relative 'menu'

class Takeaway

  attr_reader :basket

  def initialize(menu_klass)
    @menu = menu_klass.new
    @basket = Hash.new(0)
    @total = 0
  end

  def menu
    @menu.show_menu
  end

  def order(name, quantity = 1)
    fail "Sorry, we don't have that!" unless @menu.show.include?(name)
    @basket[name] += quantity
    puts "#{quantity}x #{name}(s) added to your basket."
  end

  def total
    @total = 0
    @basket.each { |name, quantity|
      @total += @menu.price(name) * quantity
    }
    @total
  end

  def checkout(amount)
    fail "You need to pay exactly #{total}!" unless amount == total
    puts "Your order is on its way!"
  end

end
