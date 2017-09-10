class Takeaway

  def initialize(menu)
    @menu = menu
  end

  def print
    menu.print
  end

private

  attr_reader :menu

end
