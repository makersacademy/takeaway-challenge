require_relative 'cart'

class TakeAway

  def initialize
    @menu = { "burger" => 5, "fries" => 3, "shake" => 2 }
  end

  def show_menu
    @menu
  end

end
