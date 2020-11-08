class RamenBar

  attr_accessor :dishes

  MENU = {
    'tonkotsu' => 10,
    'kakugiri' => 9,
    'shoyu'    => 9,
    'gyoza'    => 5,
    'edamame'  => 3
  }

  def initialize(dishes = MENU)
    @dishes = dishes
  end

  def menu
    @dishes.map { |dish, price| "#{dish} - £#{price}" }.join(', ')
  end

  def order
  end
end

