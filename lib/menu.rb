class Menu

  def initialize
    @dishes = load_dishes
  end

  def dishes
    @dishes.dup
  end

  private

  def load_dishes
    {
      "Cheese & Tomato"   => 6.00,
      "Mighty Meaty"      => 9.00,
      "Pepperoni Passion" => 8.00,
      "Tandoori Hot"      => 9.00,
      "Vegi Sizzler"      => 8.00
    }
  end

end
