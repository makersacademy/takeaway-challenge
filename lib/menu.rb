class Menu

def initialize
  @korean_dishes = {
    kimchi_jjigae: 8.99,
    galbi: 10.99,
    kimbap: 4.99,
    bibimbap: 6.99,
    kimchi_jeon: 4.99
  }
end

  def welcome
    "Welcome to Simon's Korean Restaurant!"
    "Our specials today are:"
  end

  def print_dishes
    @korean_dishes.map { |k,v| p "#{k}, £#{v}" }
  end
end
