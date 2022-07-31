class Menu

  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def print
    @dishes.map do |dish, price|
      #dish.to_s
      #price.to_f
      "#{dish.to_s} £#{'%.2f' % price}"
    end.join(",")
  end
end
