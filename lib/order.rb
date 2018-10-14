require './lib/menu.rb'

class Order
  attr_reader :dishes

  def initialize(menu = Menu.new)
    @dishes = []
    @menu = menu
  end

  def dish(dish, quantity = 1)
    @dish = @menu.menu.map { |_,dishes| dishes.assoc(dish) }.flatten.compact
    quantity.times { @dishes << @dish }
    quantity == 1 ? "1 #{dish} has been added to your order" : "#{quantity} #{dish}'s have been added to your order"
  end

  def summary
    @summary = ["\nSummary"]
    dish_names = dishes.flatten.uniq.select { |x| x.is_a? String }
    dish_names.each { |dish| @summary << "#{@dishes.flatten.count(dish)}x " + dish + " - £#{'%.2f' % (@dishes.flatten.count(dish) * @menu.menu.map { |_,value| value[dish] }.compact[0])}"}
    @summary <<  "Order Total - £#{'%.2f' % @dishes.flatten.select { |x| x.is_a? Numeric }.inject(:+)}"
    puts @summary
  end
end
