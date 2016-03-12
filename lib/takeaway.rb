
class TakeAway
  attr_reader :menu

  def initialize
    @menu = {}
  end

  def list_menu
    @menu.dup
  end

end
