class TakeAway
  attr_accessor :basket, :total
  def initialize()
    @basket = []
    @total = 0
  end

  def read_menu
    { "Salted Caramel Shake" => 5.99, "Red Velvet Shake" => 5.99, "Cookie Dough Sandwich" => 4.99,
       "Choc-zilla Freak Shake" => 8.50, "Vanilla Milkshake" => 3.99 }
  end

  def order(item, amount=1)
    #read_menu.has_key?(item)
    chosen_item = read_menu.select { |k,v| k == item }

    amount.times{@basket.push(chosen_item)}
    amount.times{@total += chosen_item.values[0]}

    #amount.times{@total += chosen_item}
    p "#{amount}x #{item}(s) has been added to your basket 🧺✔️"
  end
end

t = TakeAway.new
t.order("Salted Caramel Shake", 2)
p t.total
