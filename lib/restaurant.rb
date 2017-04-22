class Restaurant

  MENU = { "chips" => 2,
    "mystery chicken" => 4,
    "darlas dirty rice" => 2,
    "chow mein" => 3,
    "dumplings" => 3,
    "pan galactic gargle blaster" => 314159,
    "crispy_duck" => 2,
    "chish_n_fips" => 1,
    "spring_rolls" => 2 }

  attr_reader :menu, :basket, :subtotal

  def initialize
    @menu = MENU
    @basket = []
    @subtotal = []
  end

  def read_menu
    p @menu
  end

  def dish_available?(dish)
    @menu.has_key?(dish)
  end

  def order(dish, amount)
    if dish_available?(dish)
      amount.times {@basket << dish}
      return "Added #{amount} #{dish}(s) to your order."
    else
      return "We are all out of #{dish}(s)! What else would you like?"
    end
  end

  def get_total
    @basket.each { |dish| @subtotal << @menu.values_at(dish) }
    @subtotal.flatten.inject(:+)
    a = @subtotal.flatten.inject(:+)
    p "Your subtotal is #{a}"
  end

end
