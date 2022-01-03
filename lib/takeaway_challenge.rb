class Takeaway
  attr_reader :menu

  def initialize
    @menu = {ramen: 5.60, chicken: 4.20, salad: 3.99}
  end

  def list_dishes
    @menu.map do |dish,price|
      "%s: £%.2f" % [dish.to_s.capitalize,price]
    end.join(", ")
  end
end