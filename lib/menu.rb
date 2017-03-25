class Menu

  def view
    [
      Hash.new(nil)
    ]
  end

  def menu_entry_maker(food,price)
    {
      food: food,
      price: price
    }

  end

end
