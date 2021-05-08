require_relative 'menu.rb'

class Restaurant
  attr_reader :menu
  attr_reader :basket

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def show_menu
    menu.list
  end

  def order(dish, portions = 1)
    if @basket.include? dish
      @basket[dish] += portions
    else @basket.store(dish, portions)
    end
  end

  def basket_summary
    #loop over the k,v pairs in the hash
    "#{@basket[0]} portions of #{@basket.keys[0]}"
    #code to calculate subtotal for each dish/portion pair in basket
  end

end
