
class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "pizza" => 10,
      "chips" => 5,
      "burger" => 6,
      "falafel" => 4,
      "halloumi" => 5
      }
  end

  def view_menu
    @dishes.map { |dish, price|
      "#{dish.capitalize}: £#{price}"
    }.join(', ')
  end

end
