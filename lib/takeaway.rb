class TakeAway
  attr_accessor :basket
  def initialize()
    @basket = []
  end

  def read_menu
    { "Salted Caramel Shake" => 5.99, "Red Velvet Shake" => 5.99, "Cookie Dough Sandwich" => 4.99,
       "Choc-zilla Freak Shake" => 8.50, "Vanilla Milkshake" => 3.99 }
  end

  def order(item, amount=1)
    #read_menu.has_key?(item)
    chosen_item = read_menu.select { |k,v| k == item }
    amount.times{  @basket.push(chosen_item) }
    p @basket
  end
end

t = TakeAway.new
t.order("Salted Caramel Shake")
