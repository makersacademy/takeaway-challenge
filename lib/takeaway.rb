require_relative 'menu'

class TakeAway
  attr_reader :menu, :basket, :sum

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @sum = 0
  end

  def read_menu
    @menu.list
  end

  def select(choice, count)
    name = @menu.items.keys[choice - 1]
    add(name, count)
    add_sum(name)
  end

  def add(name, count)
    @basket[name] = count
    puts "#{count}x #{name} added to your basket."
  end

  def add_sum(name)
    @sum += @menu.items[name]
  end

  def basket_summary
    @basket.each do |key, value|
      puts "#{key} x#{value} = #{@menu.items[key] * value}"
    end
  end

  def total
    "Total: £#{@sum}"
  end

  def checkout
    "Thank you! Your order was placed and will be delivered before 18:52"
  end

end
