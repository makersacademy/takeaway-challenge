class Menu
  DISHES = {:burger => 5, :hotdog => 4, :fries => 3, :milkshake => 4, :soda => 3}

  attr_reader :dishes

  def initialize
    @dishes = DISHES
  end

  def list_dishes
    DISHES.each {|item, price| puts "#{item.to_s.capitalize} £#{price}"}
  end
end
