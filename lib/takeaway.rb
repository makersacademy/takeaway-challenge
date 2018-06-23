class TakeAway

  attr_reader :english_menu

  def initialize
    @english_menu = [
      { "Fish and chips" => 5.50 },
      { "black pudding" => 4.50 },
      { "full breakfast" => 7.50 },
      { "scotch egg" => 2.50 }]
    end

  def show_menu
    @english_menu
  end

end
