class Menu
  attr_accessor :menu

  def initialize
    @menu = {
      :avocade_maki => 4,
      :cucumber_maki => 4,
      :salmon_sashimi => 7,
      :vegetable_ramen => 6,
      :katcu_curry => 9,
      :miso_soup => 3,
      :crab_handroll => 6,
    }
  end

  def check_menu
    @menu
  end
end
