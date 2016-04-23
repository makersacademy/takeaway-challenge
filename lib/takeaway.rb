class Takeaway

  def initialize
    @menu = {
      'onion bhaji' => 3.50,
      'chicken dhansak' => 7.95,
      'lamb jalfrezi' => 8.95
    }
    @basket_items = []
  end

  def menu
    @menu.dup
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  def order(item)
    "#{item} was added to your order"
  end

  def basket
    @basket_items.dup
  end

end
