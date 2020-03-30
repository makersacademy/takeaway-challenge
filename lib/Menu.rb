class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      "fish"=> 5,
      "rice"=> 3,
      "peas" => 2,
      "mash" => 3,
    }
  end

  def print
    dishes.each do |dish, price|
      string = "#{dish}\n £#{price}"
      return string
    end
  end

end
