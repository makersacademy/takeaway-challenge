class TakeAway

  attr_reader :menu

  def initialize
    @menu = {
      :wonton_soup => 2,
      :spring_rolls => 2,
      :kung_po => 5,
      :fried_squid => 6,
      :chow_mein => 9,
      :roasted_duck => 9
    }
  end

  def see_menu
    @menu
  end

end

# feature test
# takeaway = TakeAway.new
# takeaway.see_menu
# #returns hash - list of food with prices
