require_relative 'menu'

module Calculator

include Menu

def get_overall_price
  get_item_prices
  @overall_price = @unit_prices.inject(0) {|sum, i|  sum + i }
end

def get_item_prices
  @unit_prices = []
  @order_list.each{|item, quantity| @unit_prices << PRICE_LIST[item] * quantity.to_f}
  @unit_prices
end
end