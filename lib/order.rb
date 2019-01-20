require_relative 'menu'

class Order

  attr_accessor :basket

  def initialize(menu = Menu.new.menu)
    @menu = menu
    @basket = Hash.new(0)

  end

  def add_to_order(choice, quantity = 1)
    @basket[choice] += quantity
    print "#{quantity} x #{choice} added to your order."
  end

  def total_order
    total = 0
    @basket.each do |choice, quantity|
      @menu.each do |menu|
        if menu[choice]
          total += menu[choice] * quantity
        end
      end
    end

  end

end
