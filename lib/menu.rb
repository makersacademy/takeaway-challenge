class Menu
  attr_reader :dishes

  def initialize(dishes = {})
    @dishes = dishes
    set_dishes
  end

  def all
    @dishes
  end

  def price(name)
    @dishes[name]
  end

  def available?(name)
    @dishes[name] != nil
  end

  private

  def set_dishes
    if @dishes == {}
      @dishes = {
        "Hummus" => 5,
        "Falafel Plate" => 10,
        "Gyro" => 12,
        "Soft Drink" => 2,
        "Pita" => 1,
      }
    end
  end

end
