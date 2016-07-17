class Takeaway

  attr_reader :menu, :order

  def initialize(menu)
    @menu = menu
    @order = Hash.new(0)
  end
end
