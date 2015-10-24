class Menu

  attr_reader :items

  def initialize
    @items = { singapore_fried_noodles: 7.95,
               chicken_noodle_soup: 3.95,
               king_prawns: 7.95,
               black_bean_beef: 7.95,
               sesame_toast: 3.95,
               cola: 0.99 }
  end

end
