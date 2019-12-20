class Takeaway
  attr_reader :menu, :selected_items, :sum

  def initialize
    @menu = { "burritos" => 7, "tacos" => 5, "chips" => 3, "guacamole" => 2 }
    @selected_items = []
    @sum = 0
  end

  def order(item, quantity)
    @selected_items << { item => quantity }
  end

  def total
    item_totals = []
    @selected_items.map do |item|
      price = item.keys.join()
      quantity = item.values.join().to_i
      item_totals << (@menu[price] * quantity)
    end
    "The total for the order is £#{item_totals.sum}."
  end

  def receipt
  end
end
