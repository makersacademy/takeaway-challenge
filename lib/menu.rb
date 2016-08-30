require_relative 'order'

class Menu

  def initialize
    @menu = {'chips' => 1, 'oreo' => 3, 'cake' => 2}
  end

  def show
    @menu
  end

end
