class Kebabshop

  KEBABS = { "Donner kebab" => 4,
    "Adana kebab" => 5,
    "Iskender kebab" => 6 }

  attr_reader :kebabs, :cart

  def initialize
    @cart = []
    @kebabs = KEBABS
  end

  def place_order(kebab, number)
    number.times {@cart << kebab}
    puts "a total of #{number} #{kebab}(s) have been placed in your cart"
  end

  # def show_order
  #   @cart
  # end


  def check_menu
    @kebabs
  end




end
