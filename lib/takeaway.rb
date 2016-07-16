class TakeAway

  attr_reader :menu, :basket
  attr_writer :menu

  def initialize
    @basket = []

    @menu = {
      :wonton_soup => 2,
      :spring_roll => 2,
      :kung_po => 5,
      :fried_squid => 6,
      :chow_mein => 9,
      :roasted_duck => 9
    }
  end

  def see_menu
    @menu
  end

  def order(dish, number=1)
    # check if dish is a menu key
    # if it is, save the key and value as new_dish
    # push new_dish to the basket
    new_dish = @menu.select {|k, v| k==dish}
    number.times{@basket.push(new_dish)}
  end


  
end
