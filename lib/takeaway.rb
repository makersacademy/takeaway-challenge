require './lib/menu.rb'
require './lib/calculate.rb'
require './lib/text.rb'

class Takeaway

  attr_reader :basket, :list, :text, :menu, :sum

  def initialize(menu_class: Menu, sum_class: Calculate, text_class: Text)
    @basket = []
    @menu = menu_class.new
    @sum = sum_class.new
    @text = text_class.new
  end

  def menu_list
    @menu.list
  end

  def order(dish)
    @basket << add_dish(dish)
  end

  def total
    @sum.total(@basket)
  end
  #
  # def check_out
  #   empty_basket?
  #   text.message(total)
  #   @basket.clear
  # end
  
  def empty_basket?
    raise "You haven't ordered anything!" if @basket.empty?
  end

  private
  def add_dish(dish)
    @menu.list.select { |key| key[:name].include?(dish) }
  end

end
