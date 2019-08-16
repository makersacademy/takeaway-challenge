class Dishes
  def initialize
    @dishes = {
      "chicken burger" => 10,
      "fish and chips" => 8,
      "steak" => 20,
      "chips" => 5,
      "beef burger" => 10
    }
  end

  def menu
    arr = @dishes.map {
      |dish, price|
      "#{dish}, £#{price}"

    }
    arr.join("\n")
  end
end
