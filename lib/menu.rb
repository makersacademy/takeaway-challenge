class Menu
  attr_reader :dishes

  def initialize(dishes = { "burger" => 6.50, "fries" => 1.50 })
    @dishes = dishes
  end

  def list
    dishes.each do |item, value|
      "#{item}: £#{value}"
    end
  end
end
