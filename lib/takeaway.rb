class Takeaway

  attr_reader :orders

  def initialize menu
    @menu = menu
    @orders = Hash.new
  end

  def order dish
    orders[dish] = @menu.content[dish]
  end

end
