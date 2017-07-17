require "./lib/menu.rb"

class Basket
  include Menu
  #attr_reader :basket

  def initialize
      @basket = Hash.new(0)
  end
  
  def view_basket
    puts "Your basket items:"
    @basket.each { |k,v| puts "#{k}: #{v}" }
  end
    
  def add_to_basket(item)
    @basket[item] = Menu::BURGERS[item.to_sym]
  end

  def remove_from_basket(item)
    @basket.delete(item)
  end

  def check_out
    total = 0
    @basket.each { |key, value| total += value }
    puts "Your total is: #{total}"
  end

end

