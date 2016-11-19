require './lib/menu'
require './lib/order'
class TakeAway

attr_reader :menu_klass, :basket, :total

  def initialize(menu_klass)
    @menu_klass = menu_klass
    @basket = Hash.new
  
  end

  def read_menu
    @menu_klass.menu
  end

  def order(option, number)
    number.times do
    read_menu.each do |food,price|
      if food == option
        @basket.store(food,price)
      end
      end
    end
  end






end
