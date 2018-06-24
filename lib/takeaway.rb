# for rspec testing
require './lib/menu'
# for irb testing
# require './menu'

class Takeaway

  attr_reader :basket, :total_order, :total

  def initialize(menu_list)
    @menu_list = menu_list.price_list
    @basket = {}
    @total_order = []
    @total = []
  end

  def print_menu
    p @menu_list
  end

  def add_to_basket(dish, quantity)
    @basket[dish] = quantity
    @total_order << @basket
    return "#{dish} burrito x #{quantity} added"
  end

  def sub_total
    basket.each do |k, v|
      @price = @menu_list[k]
      @total << v * @price
      return "#{k} x #{v} is £#{'%.2f' % (v * @price)}"
    end
  end

  def total_price
    @total.inject(:+)
  end

  # test that total is an empty array
  # test that basket.each totals dish by qty
  # test that @total is array of prices
  # test that total_price sums array of prices
end

# For running the program in irb
# menu = Menu.new
# takeaway = Takeaway.new(menu)
# takeaway.print_menu
