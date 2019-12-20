require './lib/menu.rb'

class Order
  attr_reader :choice
  def initialize(menu = Menu)
    @menu = menu
    @choice = []
  end

  def see_menu
    @my_menu = @menu.new
    @my_menu.list
  end

  def choose_item(name)
    self.see_menu
    @choice << {name => @my_menu.get_price(name)}
  end

  def total_price
    t = 0
    @choice.each do |i|
      i.each_value { |v| t += v }
    end
    t
  end
end
