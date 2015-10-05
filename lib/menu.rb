class Menu

  attr_reader :dishes, :menu

  def initialize
    @dishes = { "crispy chilli beef" => 5,
      "sweet and sour chicken" => 4,
      "egg fried rice" => 2
    }
  end

  def price_list
    dishes.each { |dish, price| "#{dish}: £#{price}"}
  end

end
