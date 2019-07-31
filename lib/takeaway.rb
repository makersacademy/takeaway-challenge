
class Takeaway
  attr_reader :menu
  attr_reader :current_order

  def initialize
    @menu = {bread: 5, apples: 2}
    @current_order = {bread: 0, apples: 0}
  end

  def select(item)
    @current_order[item.to_sym] = @current_order[item.to_sym] + 1
  end
end