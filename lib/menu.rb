class Menu
  def initialize
    @menu = { :chicken_noodle_soup => 6,
    :chow_mein => 5.50,
    :singapore_rice => 3.25,
    :prawn_crackers => 2.75 }
  end

  attr_reader :menu

end
