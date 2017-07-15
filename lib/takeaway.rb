class Takeaway

  attr_reader :menu, :orders

  def initialize(menu = Menu.new)
    @menu = menu
    @orders = []
  end

end
