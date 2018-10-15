require './lib/menu.rb'

class Order
  attr_reader :dishes, :menu

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
    dishes_to_summary
    total_to_summary
    puts @summary
  end

  private

  def dishes_to_summary
    dishes.flatten.uniq.select { |x| x.is_a? String }.each do |dish|
      @summary << "#{@dishes.flatten.count(dish)}x " + dish + " - £#{'%.2f' % (@dishes.flatten.count(dish) * @menu.menu.map { |_,value| value[dish] }.compact[0])}"
    end
  end

  def total_to_summary
    @summary <<  "Order Total - £#{'%.2f' % @dishes.flatten.select { |x| x.is_a? Numeric }.inject(:+)}"
  end
end
