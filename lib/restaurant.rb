require 'order'

class Restaurant

  MENU = { "mystery chicken" => 4,
    "darlas dirty rice" => 2,
    "chow mein" => 3,
    "dumplings" => 3,
    "the pan galactic gargle blaster" => 314159,
    "crispy_duck" => 2,
    "chish_n_fips" => 1,
    "spring_rolls" => 2 }

  attr_reader :menu

  def initialize
    @menu = MENU
  end

  def read_menu
    p @menu
  end

end
