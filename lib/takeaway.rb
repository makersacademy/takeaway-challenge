class Menu

  attr_reader :dishes
  def initialize
    @dishes = {
    'Chicken Shish' => 12,
    'Adana' => 12,
    'Lamb Shish' => 12,
    'Chips' => 3,
    'Grilled Halloumi' => 4
    } 
  end

  def list_dishes
    @dishes.map { |dishes, price| 
      "#{dishes} costs £#{price}"
    }
  end
end
# food = Menu.new
# puts food.list_dishes
