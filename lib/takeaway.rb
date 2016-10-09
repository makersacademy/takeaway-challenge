require_relative 'dishes'

#attr_reader :dishes

class Takeaway

  def list_menu
    dishes
  end

  def dishes
    dishes = {
      onion_rings:   2,
      garlic_bread:  2,
      chicken_wings: 3,
      chicken_salad: 5,
      mexicano:      7,
      pepperoni:     7,
      hawaii:        9,
      coke:          2,
      juice:         3,
      cider:         3,
      beer:          4
    }
  end

end
