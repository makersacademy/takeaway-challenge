class TakeAway

  attr_reader :menu, :basket

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
    number.times{@basket.push(dish)}
  end

end
