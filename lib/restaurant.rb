class Restaurant

  MENU = { "chips" => 2,
    "mystery chicken" => 4,
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
    @basket = []
  end

  def read_menu
    p @menu
  end

  def dish_available?(dish)
    @menu.has_key?(dish)
  end

  def order(dish)
    if dish_available?(dish)
      return "Added 1 x #{dish} to your order."
    else
      return "We are all out of #{dish}! What else would you like?"
    end
  end



end
