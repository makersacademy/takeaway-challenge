class Menu

attr_reader :dishes

def initialize
  @dishes = {
    "kimchi_jjigae" => 8,
    "galbi" => 10,
    "kimbap" => 4,
    "bibimbap" => 6,
    "kimchi_jeon" => 4
  }
end

  def welcome
    p "Welcome to Simon's Korean Restaurant!"
    "Today's specials are:"
  end

  def print_dishes
    dishes.map { |k,v| p "#{k}, £#{v}" }
  end

  def get_price(key)
    dishes[key]
  end
end
