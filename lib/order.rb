require_relative 'menu'

module Order

include Menu

  def total_price
    menu_prices
    @overall_price = @unit_prices.inject(0) {|sum, i|  sum + i }
  end

  def menu_prices
    @unit_prices = []
    @menu_choice.each{|item, quantity| @unit_prices << MENU[item] * quantity.to_f}
    @unit_prices
  end
end
