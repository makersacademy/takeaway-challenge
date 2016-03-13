class Menu

  def initialize
    @contents = {
      'Meat Biriyani' => 8,
      'Ocotopus Vindaye' => 5,
      'Broad beans curry and dal pouri' => 5,
      'Rougaye eggs' => 6,
      'Gateau Pima' => 3,
      'Chicken noodles' => 7
    }
  end

  def view_contents
    @contents.dup
  end

  def add_dish(dish, price)
    @contents[dish] = price
  end

  def contains?(dish)
    view_contents.include?(dish)
  end
end
