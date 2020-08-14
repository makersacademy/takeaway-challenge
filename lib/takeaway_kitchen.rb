class TakeawayKitchen

  def initialize
    @menu = [
      { dish: "dish1", price: 1 }, 
      { dish: "dish2", price: 2 }
    ]
  end

  def menu
    @menu.dup
  end

  def return_menu
  end
end
