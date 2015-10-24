class Takeaway

  attr_reader :basket

  def initialize
    @menu = {}
    @basket = {}
    @total = 0
  end

  def add_dish(name, price)
    @menu.store(name, price)
  end

  def show_menu
    @menu.to_s
  end

  def order(name, quantity = 1)
    @basket.store(name, quantity)
    puts "#{quantity}x #{name}(s) added to your basket."
  end

  def total
    @total = 0
    @basket.each { |name, quantity|
      @total += @menu[name] * quantity
    }
    @total
  end

  def checkout(amount)
    fail "You need to pay exactly #{total}!" unless amount == total
    puts "Your order is on its way!"
  end

end
