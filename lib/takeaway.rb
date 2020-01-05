require_relative 'menu'

class TakeAway
  attr_reader :menu, :basket, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @total = 0
  end

  def read_menu
    @menu.list
  end

  def select(choice, count)
    name = @menu.items.keys[choice - 1]
    add(name, count)
    add_total(name)
  end

  def add(name, count)
    @basket[name] = count
    puts "#{count}x #{name} added to your basket."
  end

  def add_total(name)
    @total += @menu.items[name]
  end

  def basket_summary
    @basket.each do |key, value|
      puts "#{key} x#{value} = #{@menu.items[key] * value}"
    end
  end

end
