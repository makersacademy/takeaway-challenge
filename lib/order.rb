require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add_dish(item)
    @menu.check_availability(item)
    @basket[item] += @menu.dishes[item]
  end

  def remove_dish(item)
    check_basket(item)
    @basket[item] -= @menu.dishes[item]
  end

  def view_basket
    print_basket
    print_total
  end

  def confirm?
    true
  end

  private

  def check_basket(item)
    msg = "Item not in the basket!"
    raise msg if @basket[item] <= 0 
  end

  def print_basket
    @basket.each do |item, price| 
      if price.positive?
        puts "#{(@basket[item] / @menu.dishes[item]).round}x #{item} £#{price}"
      end
    end
  end

  def checkout_total
    @basket.select { |_, price| price.positive? }.values.reduce(:+)
  end

  def print_total
    puts "----------------"
    puts "Order Total £#{checkout_total}"
  end
end
