require_relative 'order'

class Menu

  def initialize
    @menu = {'chips' => 1, 'oreo' => 3, 'milkshake' => 2}
  end

  def show
    @menu
  end

end
