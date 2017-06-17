class Menu

attr_reader :dishes

def initialize
  @dishes = {
    kimchi_jjigae: 8.99,
    galbi: 10.99,
    kimbap: 4.99,
    bibimbap: 6.99,
    kimchi_jeon: 4.99
  }
end

  def welcome
    "Welcome to Simon's Korean Restaurant!"
    "Today's specials are:"
  end

  def print_dishes
    @dishes.map { |k,v| p "#{k}, £#{v}" }
  end
end
