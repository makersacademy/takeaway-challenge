require_relative 'takeaway'

class Order

  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add_items(item, quantity)
    @basket[item] = quantity
  end

  def basket_contents
    @basket.each do |dish, quantity|
      puts "#{dish} x #{quantity} total: £#{Menu.new.menu[dish] * quantity}"
    end
  end

  def basket_total
    total = @basket.map { |dish, quantity|
      Menu.new.menu[dish] * quantity
    }.inject(:+)
    puts "Total: £#{total}"
  end
end
