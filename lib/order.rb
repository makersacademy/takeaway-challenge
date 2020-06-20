class Order
attr_reader :customer_order

  def initialize
    @customer_order = []
  end

  def show_list
    { 
      "Vegetable Ramen" => 5,
      "Crispy Tofu" => 4
    }
  end

  def add(dish)
    @customer_order << dish
  end

end