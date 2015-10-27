class Menu
  def initialize
    @list = {
      burger: 4.5,
      kebab: 3.5,
      deluxe_fried_chicken: 4.5,
      chicken_nuggets: 3,
      pie: 4,
      fries: 2,
      onion_rings: 2,
      coke: 1,
      lilt: 1
    }
  end

  def access
    @list
  end
end
