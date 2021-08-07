class Takeaway

  attr_reader :menu

  def initialize(dishes = Menu.new)
    @menu = dishes.menu
  end

end
