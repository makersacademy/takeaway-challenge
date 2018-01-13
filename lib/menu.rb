class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "Fish" => 2365,
      "Chips" => 1836,
      "Kebab" => 4317
    }
  end

  def list
    @dishes.map { |name, price| "#{name}: £#{price}" }
  end

  def on_menu?(dish)
    !dishes[dish].nil?
  end

  def price(dish)
    dishes[dish]
  end


end
