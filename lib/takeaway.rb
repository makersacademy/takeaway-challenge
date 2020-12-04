class TakeAway
  # attr_reader :order
  def initialize
    @menu = { "spring roll" => 0.99, "char sui bun" => 3.99, "pork dumpling" => 2.99, "peking duck" => 7.99, "fu-king fried rice" => 5.99 }
    @basket = []
  end

  def menu
    @menu
  end

  def order(meal)
    @basket << @menu[meal]
  end

  def summary
  end
end
