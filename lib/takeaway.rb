class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

end
