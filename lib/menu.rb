class Menu
  attr_reader :list
  def initialize
    @list = {
      'Szechuan sauce' => 25,
      'Pickle Rick' => 5,
      'Concentrated dark matter' => 45,
      'Mega seeds' => 10,
      'Wamen noodles' => 16,
      "Memes (Careful: extra spicy)" => 50,
      "Bitconnect sponsored nuggets" => 20
    }
  end

  def print
    array = []
    @list.each { |key, value|
      array.push(key + ": " + value.to_s)
    }
    puts array
    array
  end
end
