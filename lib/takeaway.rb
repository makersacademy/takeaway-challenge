class Takeaway

  def initialize(menu:menu)
    @menu = menu
  end

  def dishes_with_prices
    menu.print
  end

private
attr_reader :menu
end
